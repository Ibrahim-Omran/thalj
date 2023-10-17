class RegisterState {
  final String userName;
  final String password;
  final String confirmPassword;
  final String email;
  final String phone;
  final bool isChecked;
  final bool obscureText;
  final bool confirmObscureText;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  RegisterState({
    this.userName = '',
    this.password = '',
    this.confirmPassword = '',
    this.email = '',
    this.phone = '',
    required this.isChecked,
    required this.obscureText,
    required this.confirmObscureText,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  RegisterState copyWith({
    String? userName,
    String? password,
    String? confirmPassword,
    String? phone,
    String? email,
    bool? obscureText,
    bool? confirmObscureText,
    bool? isChecked,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
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
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
