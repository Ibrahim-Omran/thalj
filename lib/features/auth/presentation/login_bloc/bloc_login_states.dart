
import 'package:thalj/features/auth/presentation/login_bloc/login_submission_state.dart';

class LoginState {
  final String userName;
  final String password;
  final bool obscureText;
  final LoginSubmissionStatues submissionStatues;

  LoginState(
      {this.userName = '',
      this.password = '',
        required this.obscureText,
      this.submissionStatues = const InitialLoginSubmissionStatue()});

  LoginState copyWith({
    String? userName,
    String? password,
    bool? obscureText,
    LoginSubmissionStatues? submissionStatues,
  }) {
    return LoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
        submissionStatues: submissionStatues ?? this.submissionStatues);
  }
}
