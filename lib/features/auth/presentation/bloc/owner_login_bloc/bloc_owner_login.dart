import 'package:bloc/bloc.dart';
import 'package:thalj/features/auth/domain/models/admin_model.dart';
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
      final AdminModel? adminData = await authRepository.ownerLogin(
        email: event.email,
        password: event.password,
      );

      if (adminData != null) {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          adminData: adminData,
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
        error: false,
      ));
    }
  }
}
