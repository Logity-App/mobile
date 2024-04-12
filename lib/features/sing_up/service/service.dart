import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobile/common/exceptions/exceptions.dart';
import 'package:mobile/features/sing_up/api/abstract_sign_up_repository.dart';
import 'package:mobile/features/sing_up/api/models/send_sms_code.dart';
import 'package:mobile/features/sing_up/api/models/verify_phone_number.dart';
import 'package:mobile/features/sing_up/service/exceptions.dart';
import 'package:mobile/features/sing_up/storage/abstract_sign_up.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:tuple/tuple.dart';

class SignUpService {
  final SignUpStorageContract storage;
  final SignUpRepositoryContract repository;

  final StreamController<int> tickerController;
  final StreamController<bool> timeoutController;

  SignUpService()
      : tickerController = StreamController<int>.broadcast(),
        timeoutController = StreamController<bool>.broadcast(),
        repository = GetIt.I<SignUpRepositoryContract>(),
        storage = GetIt.I<SignUpStorageContract>();

  Future<void> sendSmsCode(String smsCode) async {
    String phone = await storage.getPhone();
    await _sendSmsCode(phone, smsCode);
  }

  Future<void> removePersistInfo() async {
    storage.remove().catchError((e) {
      throw InternalException(e.toString());
    });
  }

  void startTimer(int durationTimer) {
    var counterSec = durationTimer;
    tickerController.add(counterSec);
    print("Check");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      counterSec--;
      tickerController.add(counterSec);
      if (counterSec == 0) {
        timer.cancel();
        timeoutController.add(true);
      }
    });
  }

  Future<void> _sendSmsCode(String phone, String smsCode) async {
    try {
      var resp = await repository
          .sendSmsCode(SendSmsCodeRequest(phone: phone, code: smsCode))
          .catchError((e) {
        throw ResponseFailureException(e.toString());
      });
      if (resp.status != "Success") {
        throw UserException("status isn't success");
      }
      if (resp.error != null) {
        throw UserException(resp.error!);
      }
    } on AppExpection catch (e) {
      throw SystemException(e.cause);
    }
  }

  Future<void> resendSmsCode() async {
    String phone = await storage.getPhone();
    var res = await _verifyPhoneNumber(phone);
    storage.setPhoneSmsCode(res.item1, phone); // sms code, phone
    storage.setDurationTimer(res.item2);

    startTimer(res.item2);
  }

  Future<Tuple2<String, int>> _verifyPhoneNumber(String phone) async {
    var resp = await repository
        .verifyPhoneNumber(VerifyPhoneNumberRequest(phone: phone))
        .catchError((e) {
      throw (ResponseFailureException(e.toString()));
    });

    throwIf(resp.error != null, ResponseErrorException(resp.error!));
    throwIf(resp.status != "Success",
        ResponseErrorException("response status is not success"));
    throwIf(resp.smsCode == null,
        ResponseFailureException("response hasn't sms code"));

    return Tuple2<String, int>(resp.smsCode!, 60);
  }

  Future<void> verifyPhoneNewNumber(String phone) async {
    String normalizedPhone = _normalizePhoneNumber(phone);

    String code = await _verifyNewPhoneNumberRequest(normalizedPhone);

    await storage.setPhoneSmsCode(code, normalizedPhone);
  }

  Future<String> _verifyNewPhoneNumberRequest(String phone) async {
    var resp = await repository.verifyNewPhoneNumber(phone).catchError((e) {
      throw ResponseFailureException(e.toString());
    });
    if (resp.error != null) {
      throw ResponseErrorException(resp.error!);
    }

    if (resp.status != "Success") {
      throw ResponseErrorException("status response not success");
    }

    if (resp.code == null) {
      throw ResponseFailureException("response hasn't contains sms code");
    }

    return resp.code!;
  }

  String _normalizePhoneNumber(String rawPhone) {
    try {
      PhoneNumber phone = PhoneNumber.parse(rawPhone);
      return phone.international;
    } catch (e) {
      throw UserException("phone number isn't valid: $rawPhone");
    }
  }
}
