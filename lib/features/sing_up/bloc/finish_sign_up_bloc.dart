import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/common/exceptions/exceptions.dart';
import 'package:mobile/features/sing_up/bloc/finish_sign_up_event.dart';
import 'package:mobile/features/sing_up/bloc/finish_sign_up_state.dart';
import 'package:mobile/features/sing_up/service/service.dart';

class FinishBloc extends Bloc<FinishEvent, FinishState> {
  final SignUpService service;

  FinishBloc()
      : service = GetIt.I<SignUpService>(),
        super(FinishInitialState()) {
    on<FinishBackEvent>((event, emit) async {
      await _handleBackEvent(event, emit);
    });

    on<FinishRegisterEvent>((event, emit) async {
      await _handleRegisterEvent(event, emit);
    });
  }

  Future<void> _handleRegisterEvent(
      FinishRegisterEvent event, Emitter emit) async {
    try {
      emit(FinishRegisterLoadingState());
      await service.signUpRegister(event.defaultTag, event.birthDay);
      emit(FinishRegisterSuccessState());
    } on AppExpection catch (e) {
      emit(FinishRegisterFailureState(errorMessage: e.cause));
    }
  }

  Future<void> _handleBackEvent(FinishBackEvent event, Emitter emit) async {
    emit(FinishBackState());
  }
}
