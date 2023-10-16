abstract class AdminLoginEvent {}

class AdminLoginUserName extends AdminLoginEvent {
  final String userName;

  AdminLoginUserName({required this.userName});
}

class AdminLoginPassword extends AdminLoginEvent {
  final String password;

  AdminLoginPassword({required this.password});
}

class AdminLoginToggleObscureText extends AdminLoginEvent {
  final bool isPassword;

  AdminLoginToggleObscureText({required this.isPassword});
}

class AdminLoginSubmitted extends AdminLoginEvent {
  final String email;
  final String password;

  AdminLoginSubmitted({required this.email, required this.password});
}
