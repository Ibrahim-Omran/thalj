abstract class RegisterSubmissionStatues {
  const RegisterSubmissionStatues();
}

class InitialRegisterSubmissionStatue extends RegisterSubmissionStatues {
  const InitialRegisterSubmissionStatue();
}

class RegisterSubmitting extends RegisterSubmissionStatues {}

class RegisterSubmitSuccess extends RegisterSubmissionStatues {}

class RegisterSubmitFailed extends RegisterSubmissionStatues {
  final String  exception;

  RegisterSubmitFailed(this.exception);
}
