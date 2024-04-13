class FinishState {}

class FinishInitialState extends FinishState {
  FinishInitialState();
}

class FinishRegisterValidationErrorState extends FinishState {
  final String errorMessage;
  FinishRegisterValidationErrorState({required this.errorMessage});
}

class FinishRegisterFailureState extends FinishState {
  final String errorMessage;
  FinishRegisterFailureState({required this.errorMessage});
}

class FinishRegisterSuccessState extends FinishState {
  FinishRegisterSuccessState();
}

class FinishRegisterLoadingState extends FinishState {
  FinishRegisterLoadingState();
}

class FinishBackState extends FinishState {
  FinishBackState();
}

class FiniashOpenCalendar extends FinishState {}
