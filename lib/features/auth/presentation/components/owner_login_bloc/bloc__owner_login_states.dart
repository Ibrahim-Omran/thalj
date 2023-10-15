

import 'login__owner_submission_state.dart';

class OwnerLoginState {
  final String userName;
  final String password;
  final bool obscureText;
  final OwnerLoginSubmissionStatues submissionStatues;

  OwnerLoginState(
      {this.userName = '',
      this.password = '',
        required this.obscureText,
      this.submissionStatues = const InitialOwnerLoginSubmissionStatue()});

  OwnerLoginState copyWith({
    String? userName,
    String? password,
    bool? obscureText,
    OwnerLoginSubmissionStatues? submissionStatues,
  }) {
    return OwnerLoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
        submissionStatues: submissionStatues ?? this.submissionStatues);
  }
}
