class FinishEvent {}

class FinishRegisterEvent extends FinishEvent {
  final String defaultTag;
  final String birthDay;
  FinishRegisterEvent({required this.defaultTag, required this.birthDay});
}

class FinishBackEvent extends FinishEvent {
  FinishBackEvent();
}
