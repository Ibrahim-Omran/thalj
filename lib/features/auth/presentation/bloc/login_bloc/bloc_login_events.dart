abstract class LoginEvent {}

class LoginUserName extends LoginEvent {
  final String userName;

  LoginUserName({required this.userName});
}

class LoginPassword extends LoginEvent {
  final String password;

  LoginPassword({required this.password});
}

class LoginToggleObscureText extends LoginEvent {
  final bool isPassword;

  LoginToggleObscureText({required this.isPassword});
}

class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});
}
