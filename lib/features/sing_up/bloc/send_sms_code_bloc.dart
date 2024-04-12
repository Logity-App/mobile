import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/common/exceptions/exceptions.dart';
import 'package:mobile/features/sing_up/bloc/send_sms_code_event.dart';
import 'package:mobile/features/sing_up/bloc/send_sms_code_state.dart';
import 'package:mobile/features/sing_up/service/service.dart';

class SendSmsCodeBloc extends Bloc<SendSmsCodeEvent, SendSmsCodeState> {
  final SignUpService service;

  SendSmsCodeBloc(SendSmsCodeStateInitial state)
      : service = GetIt.I<SignUpService>(),
        super(state) {
    on<SendSmsCodeEventBack>((event, emit) async {
      await _handleEventBack(event, emit);
    });

    on<SendSmsCodeEventNext>((event, emit) async {
      await _handleSignUpEventNext(event, emit);
    });

    on<SendSmsCodeEventResend>((event, emit) async {
      await _handleSignUpEventResend(event, emit);
    });
  }

  Future<void> _handleEventBack(
      SendSmsCodeEventBack event, Emitter emit) async {
    service.removePersistInfo();
    emit(SendSmsCodeStateBack());
  }

  Future<void> _handleSignUpEventResend(
      SendSmsCodeEventResend event, Emitter emit) async {
    try {
      emit(SendSmsCodeStateLoading());
      await service.resendSmsCode();
      emit(SendSmsCodeStateResendSuccess());
    } on AppExpection catch (e) {
      emit(SendSmsCodeStateResendFailure(exceptionMessage: e.cause));
    }
  }

  Future<void> _handleSignUpEventNext(
      SendSmsCodeEventNext event, Emitter emit) async {
    try {
      emit(SendSmsCodeStateLoading());
      await service.sendSmsCode(event.smsCode);
      emit(SendSmsCodeStateNextSuccess(smsCode: event.smsCode));
    } on AppExpection catch (e) {
      emit(SendSmsCodeStateResendFailure(exceptionMessage: e.cause));
    }
  }
}

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final SignUpService service;
  late StreamSubscription tickerSubscription;
  late StreamSubscription timeoutSubscription;

  TimerBloc(TimerStateInitial state)
      : service = GetIt.I<SignUpService>(),
        super(state) {
    on<TimerEventTick>((event, emit) async {
      await _handleEventTick(event, emit);
    });

    on<TimerEventTimeout>((event, emit) async {
      await _handleEventTimeout(event, emit);
    });

    tickerSubscription = service.tickerController.stream.listen((int seconds) {
      add(TimerEventTick(seconds: seconds));
    });

    timeoutSubscription =
        service.timeoutController.stream.listen((bool isTimeout) {
      add(TimerEventTimeout());
    });
  }

  Future<void> _handleEventTick(TimerEventTick event, Emitter emit) async {
    var d = Duration(seconds: event.seconds);
    emit(TimerTickState(
        formatRemainSeconds: "${d.inMinutes}:${d.inSeconds.remainder(60)}"));
  }

  Future<void> _handleEventTimeout(
      TimerEventTimeout event, Emitter emit) async {
    emit(TimerTimeoutState());
  }

  @override
  Future<void> close() async {
    tickerSubscription.cancel();
    timeoutSubscription.cancel();
    super.close();
  }
}
