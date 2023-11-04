class EditInfoState {
  final String name;
  final String phone;
  final String email;
  final String password;

  final bool obscureText;
  final bool confirmedObscureText;

  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  EditInfoState({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.password='',
    this.obscureText=false,
    this.confirmedObscureText=false,
  });

  EditInfoState copyWith({
    String? name,
    String? email,
    String? phone,
    bool? isSubmitting,
    bool? isSuccess,
    bool? obscureText,
    bool? confirmedObscureText,
    String? password,
    String? error,
  }) {
    return EditInfoState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      obscureText: obscureText??this.obscureText,
      password: password??this.password,
      confirmedObscureText: confirmedObscureText ?? this.confirmedObscureText
    );
  }
}
