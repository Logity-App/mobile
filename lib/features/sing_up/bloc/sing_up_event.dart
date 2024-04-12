part of 'sing_up_bloc.dart';

class SignUpEvent {}

class SignUpEventInitial extends SignUpEvent {}

class SignUpEventNext extends SignUpEvent {
  final String phone;

  SignUpEventNext({required this.phone});
}

class SignUpEventBack extends SignUpEvent {}
