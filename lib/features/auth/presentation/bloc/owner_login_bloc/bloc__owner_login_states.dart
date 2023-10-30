class AdminLoginState {
  final String userName;
  final String password;
  final bool obscureText;
  final bool isSubmitting;
  final bool isSuccess;
  final bool  error;

  AdminLoginState(
      {this.userName = '',
      this.password = '',
      this.obscureText = true,
      this.isSubmitting = false,
      this.isSuccess = false,
      this.error = false});

  AdminLoginState copyWith({
    String? userName,
    String? password,
    bool? obscureText,
    bool? isSubmitting,
    bool? isSuccess,
    bool? error,
  }) {
    return AdminLoginState(
        userName: userName ?? this.userName,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        error: error ?? this.error);
  }
}
