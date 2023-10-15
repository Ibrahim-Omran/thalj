abstract class OwnerLoginEvent {}

class OwnerLoginUserName extends OwnerLoginEvent {
  final String userName;

  OwnerLoginUserName ({required this.userName});
}

class OwnerLoginPassword extends OwnerLoginEvent{
  final String password;

  OwnerLoginPassword({required this.password});
}
class OwnerLoginToggleObscureText extends OwnerLoginEvent {
  final bool isPassword;

  OwnerLoginToggleObscureText({required this.isPassword});

}

class OwnerLoginSubmitted extends OwnerLoginEvent {}