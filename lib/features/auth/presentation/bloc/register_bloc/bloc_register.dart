import 'package:bloc/bloc.dart';
import 'package:thalj/features/auth/presentation/bloc/register_bloc/register_submission_state.dart';

import '../../../domain/repository.dart';
import 'bloc_register_events.dart';
import 'bloc_register_states.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(RegisterState(
    userName: '',
    password: '',
    obscureText: true,
    isChecked: true, confirmObscureText: true,
  )) {
    on<RegisterUserName>(_onUserNameChanged);
    on<RegisterPassword>(_onPasswordChanged);
    on<RegisterToggleObscureText>(_onToggleObscureText);
    on<RegisterToggleConfirmObscureText>(_confirmOnToggleObscureText);
    on<ToggleCheckbox>(_toggleCheckbox);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onUserNameChanged(RegisterUserName event, Emitter<RegisterState> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _onPasswordChanged(RegisterPassword event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onToggleObscureText(RegisterToggleObscureText event, Emitter<RegisterState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }
  void _confirmOnToggleObscureText(RegisterToggleConfirmObscureText event, Emitter<RegisterState> emit) {
    emit(state.copyWith(confirmObscureText: !state.confirmObscureText));
  }

  void _toggleCheckbox(ToggleCheckbox event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isChecked: !state.isChecked));
  }


  Future<void> _onRegisterSubmitted(RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(submissionStatues: RegisterSubmitting()));
    try {
      await authRepository.register();
      emit(state.copyWith(submissionStatues: RegisterSubmitSuccess()));
    } catch (e) {
      emit(state.copyWith(submissionStatues: RegisterSubmitFailed(e.toString())));
      print(e.toString());
    }
  }




}