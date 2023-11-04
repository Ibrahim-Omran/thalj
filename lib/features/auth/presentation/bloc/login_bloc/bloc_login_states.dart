import '../../../domain/models/login_model.dart';

class LoginState {
  final String userName;
  final String password;
  final bool obscureText;
  final bool isSubmitting;
  final bool isSuccess;
  final bool error;
  final LoginModel? loginData;

  LoginState({
    this.userName = '',
    this.password = '',
    this.obscureText = true,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error = false,
    this.loginData,
  });

  LoginState copyWith({
    String? userName,
    String? password,
    bool? obscureText,
    bool? isSubmitting,
    bool? isSuccess,
    bool ? error,
    LoginModel? loginData,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      obscureText: obscureText ?? this.obscureText,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      loginData: loginData ?? this.loginData,

    );
  }
}
