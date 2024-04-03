import 'package:mobile/features/sing_up/api/abstract_sign_up_repository.dart';
import 'package:mobile/features/sing_up/service/exceptions.dart';
import 'package:mobile/features/sing_up/storage/abstract_sign_up.dart';
import 'package:mobile/features/sing_up/storage/sign_up_storage.dart';

class SignUpService {
  final SignUpStorageContract storage;
  final SignUpRepositoryContract repository;

  SignUpService()
      : repository = initSignUpRepository(),
        storage = SignUpStorage();

  Future<void> verifyPhoneNewNumber(String phone) async {
    String code = await _verifyNewPhoneNumberRequest(phone);

    await storage.setPhoneSmsCode(code, phone);
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

    if (resp.code != null) {
      throw ResponseFailureException("response hasn't contains sms code");
    }

    return resp.code!;
  }
}
