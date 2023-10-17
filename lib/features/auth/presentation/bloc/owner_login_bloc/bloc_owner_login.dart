import 'package:bloc/bloc.dart';
import '../../../domain/repository.dart';
import 'bloc__owner_login_events.dart';
import 'bloc__owner_login_states.dart';

class AdminLoginBloc extends Bloc<AdminLoginEvent, AdminLoginState> {
  final AuthRepository authRepository;

  AdminLoginBloc({required this.authRepository})
      : super(AdminLoginState(
          userName: '',
          password: '',
          obscureText: true,
        )) {
    on<AdminLoginToggleObscureText>(_onToggleObscureText);
    on<AdminLoginSubmitted>(_onLoginSubmitted);
  }

  void _onToggleObscureText(
      AdminLoginToggleObscureText event, Emitter<AdminLoginState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  Future<void> _onLoginSubmitted(
      AdminLoginSubmitted event, Emitter<AdminLoginState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isAuthenticated = await authRepository.ownerLogin(
        email: event.email,
        password: event.password,
      );

      if (isAuthenticated) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          error: 'Authentication failed.',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        error: e.toString(),
      ));
    }
  }
}
