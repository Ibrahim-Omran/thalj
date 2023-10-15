abstract class LoginSubmissionStatues {
  const LoginSubmissionStatues();
}

class InitialLoginSubmissionStatue extends LoginSubmissionStatues {
  const InitialLoginSubmissionStatue();
}

class LoginSubmitting extends LoginSubmissionStatues {}

class LoginSubmitSuccess extends LoginSubmissionStatues {}

class LoginSubmitFailed extends LoginSubmissionStatues {
  final String  exception;

  LoginSubmitFailed(this.exception);
}
