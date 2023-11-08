import 'package:bloc/bloc.dart';
import '../../../domain/models/login_model.dart';
import '../../../domain/repository.dart';
import 'bloc_login_events.dart';
import 'bloc_login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository})
      : super(LoginState(
          userName: '',
          password: '',
          obscureText: true,
        )) {
    on<LoginToggleObscureText>(_onToggleObscureText);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  void _onToggleObscureText(
      LoginToggleObscureText event, Emitter<LoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isSubmitting: true));

    try {
      final LoginModel? loginData = await authRepository.login(
        email: event.email,
        password: event.password,
      );

      if (loginData != null) {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          loginData: loginData,
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          error: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        error: true,
      ));
    }
  }

}
