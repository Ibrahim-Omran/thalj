import 'package:bloc/bloc.dart';

import '../../../domain/repository.dart';
import 'bloc__owner_login_events.dart';
import 'bloc__owner_login_states.dart';
import 'login__owner_submission_state.dart';

class OwnerLoginBloc extends Bloc<OwnerLoginEvent, OwnerLoginState> {
  final AuthRepository authRepository;

  OwnerLoginBloc({required this.authRepository}) : super(OwnerLoginState(
    userName: '',
    password: '',
    obscureText: true,
  )) {
    on<OwnerLoginUserName>(_onUserNameChanged);
    on<OwnerLoginPassword>(_onPasswordChanged);
    on<OwnerLoginToggleObscureText>(_onToggleObscureText);
    on<OwnerLoginSubmitted>(_onOwnerLoginSubmitted);
  }

  void _onUserNameChanged(OwnerLoginUserName event, Emitter<OwnerLoginState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _onPasswordChanged(OwnerLoginPassword event, Emitter<OwnerLoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onToggleObscureText(OwnerLoginToggleObscureText event, Emitter<OwnerLoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }



  Future<void> _onOwnerLoginSubmitted(OwnerLoginSubmitted event, Emitter<OwnerLoginState> emit) async {
    emit(state.copyWith(submissionStatues: OwnerLoginSubmitting()));
    try {
      await authRepository.ownerLogin();
      emit(state.copyWith(submissionStatues: OwnerLoginSubmitSuccess()));
    } catch (e) {
      emit(state.copyWith(submissionStatues: OwnerLoginSubmitFailed(e.toString())));
      print(e.toString());
    }
  }




}