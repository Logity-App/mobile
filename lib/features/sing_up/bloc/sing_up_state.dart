part of 'sing_up_bloc.dart';

class SignUpState {}

class SignUpStateInitial extends SignUpState {}

class SignUpStateChangePhone extends SignUpState {
  final String phone;

  SignUpStateChangePhone({required this.phone});
}

class SignUpStateNextLoading extends SignUpState {
  SignUpStateNextLoading();
}

class SignUpStateNextSuccess extends SignUpState {
  SignUpStateNextSuccess();
}

class SignUpStatePhoneValidationError extends SignUpState {
  final String phone;
  final Object? exception;

  SignUpStatePhoneValidationError(
      {required this.phone, required this.exception});
}

class SignUpStateNextFailure extends SignUpState {
  final String phone;
  final String exceptionMessage;

  SignUpStateNextFailure({required this.phone, required this.exceptionMessage});
}

class SignUpStateBack extends SignUpState {
  SignUpStateBack();
}
