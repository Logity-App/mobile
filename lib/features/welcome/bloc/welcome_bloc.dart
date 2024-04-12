import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/welcome/bloc/welcome_event.dart';
import 'package:mobile/features/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeStateInitial()) {
    on<WelcomeEventInitial>((event, emit) async {
      await _handleInitial(event, emit);
    });

    on<WelcomeEventGetStarted>((event, emit) async {
      await _handleGetStarted(event, emit);
    });

    on<WelcomeEventAlreadyHaveAnAccount>((event, emit) async {
      await _handleAlreadyHaveAccount(event, emit);
    });
  }

  Future<void> _handleInitial(WelcomeEventInitial event, Emitter emit) async {
    emit(WelcomeStateInitial());
  }

  Future<void> _handleGetStarted(
      WelcomeEventGetStarted event, Emitter emit) async {
    emit(WelcomeStateGetStarted());
  }

  Future<void> _handleAlreadyHaveAccount(
      WelcomeEventAlreadyHaveAnAccount event, Emitter emit) async {}
}
