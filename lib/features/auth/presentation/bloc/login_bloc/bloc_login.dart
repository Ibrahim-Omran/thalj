import 'package:bloc/bloc.dart';

import '../../../domain/repository.dart';
import 'bloc_login_events.dart';
import 'bloc_login_states.dart';
import 'login_submission_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState(
    userName: '',
    password: '',
    obscureText: true,
  )) {
    on<LoginUserName>(_onUserNameChanged);
    on<LoginPassword>(_onPasswordChanged);
    on<LoginToggleObscureText>(_onToggleObscureText);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onUserNameChanged(LoginUserName event, Emitter<LoginState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _onPasswordChanged(LoginPassword event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onToggleObscureText(LoginToggleObscureText event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }



  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(submissionStatues: LoginSubmitting()));
    try {

      await authRepository.login(email:event.email , password: event.password);
      emit(state.copyWith(submissionStatues: LoginSubmitSuccess()));
    } catch (e) {
      emit(state.copyWith(submissionStatues: LoginSubmitFailed(e.toString())));
      print(e.toString());
    }
  }




}