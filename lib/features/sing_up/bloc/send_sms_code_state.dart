class SendSmsCodeState {}

class SendSmsCodeStateInitial extends SendSmsCodeState {
  SendSmsCodeStateInitial();
}

class SendSmsCodeStateLoading extends SendSmsCodeState {
  SendSmsCodeStateLoading();
}

class SendSmsCodeStateNextFailure extends SendSmsCodeState {
  final String smsCode;
  final String exceptionMessage;
  SendSmsCodeStateNextFailure(
      {required this.smsCode, required this.exceptionMessage});
}

class SendSmsCodeStateBack extends SendSmsCodeState {
  SendSmsCodeStateBack();
}

class SendSmsCodeStateNextSuccess extends SendSmsCodeState {
  final String smsCode;
  SendSmsCodeStateNextSuccess({required this.smsCode});
}

class SendSmsCodeStateResendFailure extends SendSmsCodeState {
  final String exceptionMessage;
  SendSmsCodeStateResendFailure({required this.exceptionMessage});
}

class SendSmsCodeStateResendSuccess extends SendSmsCodeState {
  SendSmsCodeStateResendSuccess();
}

class SendSmsCodeStateTimerChange extends SendSmsCodeState {
  final String timer;
  SendSmsCodeStateTimerChange({required this.timer});
}

class TimerState {}

class TimerStateInitial extends TimerState {
  TimerStateInitial();
}

class TimerTickState extends TimerState {
  final String formatRemainSeconds;
  TimerTickState({required this.formatRemainSeconds});
}

class TimerTimeoutState extends TimerState {
  TimerTimeoutState();
}
