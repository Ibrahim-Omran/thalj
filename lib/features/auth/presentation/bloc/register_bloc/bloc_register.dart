import 'package:bloc/bloc.dart';
import '../../../domain/repository.dart';
import 'bloc_register_events.dart';
import 'bloc_register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository})
      : super(RegisterState(
          userName: '',
          password: '',
          obscureText: true,
          isChecked: false,
          confirmObscureText: true,
        )) {
    on<ToggleCheckbox>(_isCheckedBox);
    on<RegisterToggleObscureText>(_onToggleObscureText);
    on<RegisterToggleConfirmObscureText>(_onToggleConfirmedObscureText);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _isCheckedBox(ToggleCheckbox event, Emitter<RegisterState> emit) {
    emit(state.copyWith(obscureText: !state.isChecked));
  }

  void _onToggleObscureText(
      RegisterToggleObscureText event, Emitter<RegisterState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void _onToggleConfirmedObscureText(
      RegisterToggleConfirmObscureText event, Emitter<RegisterState> emit) {
    emit(state.copyWith(obscureText: !state.confirmObscureText));
  }

  Future<void> _onRegisterSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isRegister = await authRepository.register(
          name: event.name,
          email: event.email,
          password: event.password,
          phone: event.phone);

      if (isRegister) {
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
