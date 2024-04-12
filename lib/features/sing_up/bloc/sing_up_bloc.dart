import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/common/exceptions/exceptions.dart';
import 'package:mobile/features/sing_up/service/service.dart';

part 'sing_up_state.dart';
part 'sing_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpService service;

  SignUpBloc()
      : service = GetIt.I<SignUpService>(),
        super(SignUpStateInitial()) {
    on<SignUpEventInitial>((event, emit) async {
      await _handleEventInitial(event, emit);
    });

    on<SignUpEventNext>((event, emit) async {
      await _handleSignUpEventNext(event, emit);
    });

    on<SignUpEventBack>((event, emit) async {
      await _handleEventBack(event, emit);
    });
  }

  Future<void> _handleEventInitial(
      SignUpEventInitial event, Emitter emit) async {
    emit(SignUpStateInitial());
  }

  Future<void> _handleEventBack(SignUpEventBack event, Emitter emit) async {
    service.removePersistInfo();
    emit(SignUpStateBack());
  }

  Future<void> _handleSignUpEventNext(
      SignUpEventNext event, Emitter emit) async {
    try {
      emit(SignUpStateNextLoading());
      await service.verifyPhoneNewNumber(event.phone);
      // todo durationTimer вернуть из verifyPhoneNumber
      service.startTimer(60);
      emit(SignUpStateNextSuccess());
    } on AppExpection catch (e) {
      emit(SignUpStateNextFailure(
          phone: event.phone, exceptionMessage: e.cause));
    }
  }
}
