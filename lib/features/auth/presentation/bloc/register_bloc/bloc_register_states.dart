


import 'package:thalj/features/auth/presentation/bloc/register_bloc/register_submission_state.dart';

class RegisterState {
  final String userName;
  final String password;
  final String confirmPassword;
  final String email;
  final String phone;
  final bool isChecked;
  final bool obscureText;
  final bool confirmObscureText;


  final RegisterSubmissionStatues submissionStatues;

  RegisterState(
      {this.userName = '',
      this.password = '',
      this.confirmPassword = '',
      this.email = '',
      this.phone = '',
      required this.isChecked ,
      required this.obscureText ,
      required this.confirmObscureText ,
      this.submissionStatues = const InitialRegisterSubmissionStatue()});

  RegisterState copyWith({
    String? userName,
    String? password,
    String? confirmPassword,
    String? phone,
    String? email,
    bool? obscureText,
    bool? confirmObscureText,
    bool? isChecked,
    RegisterSubmissionStatues? submissionStatues,
  }) {
    return RegisterState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        isChecked: isChecked ?? this.isChecked,
        obscureText: obscureText ?? this.obscureText,
        confirmObscureText: confirmObscureText ?? this.confirmObscureText,
        submissionStatues: submissionStatues ?? this.submissionStatues);
  }
}
