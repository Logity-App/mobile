class SendSmsCodeEvent {}

class SendSmsCodeEventInitial extends SendSmsCodeEvent {
  SendSmsCodeEventInitial();
}

class SendSmsCodeEventNext extends SendSmsCodeEvent {
  final String smsCode;

  SendSmsCodeEventNext({required this.smsCode});
}

class SendSmsCodeEventBack extends SendSmsCodeEvent {
  SendSmsCodeEventBack();
}

class SendSmsCodeEventResend extends SendSmsCodeEvent {
  SendSmsCodeEventResend();
}

class TimerEvent {}

class TimerEventInitial extends TimerEvent {}

class TimerEventTick extends TimerEvent {
  final int seconds;
  TimerEventTick({required this.seconds});
}

class TimerEventTimeout extends TimerEvent {}
