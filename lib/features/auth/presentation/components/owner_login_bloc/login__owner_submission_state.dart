abstract class OwnerLoginSubmissionStatues {
  const OwnerLoginSubmissionStatues();
}

class InitialOwnerLoginSubmissionStatue extends OwnerLoginSubmissionStatues {
  const InitialOwnerLoginSubmissionStatue();
}

class OwnerLoginSubmitting extends OwnerLoginSubmissionStatues {}

class OwnerLoginSubmitSuccess extends OwnerLoginSubmissionStatues {}

class OwnerLoginSubmitFailed extends OwnerLoginSubmissionStatues {
  final String  exception;

  OwnerLoginSubmitFailed(this.exception);
}
