abstract class RegisterEvent {}

class RegisterUserName extends RegisterEvent {
  final String userName;

  RegisterUserName({required this.userName});
}

class RegisterPassword extends RegisterEvent {
  final String password;

  RegisterPassword({required this.password});
}

class RegisterConfirmPassword extends RegisterEvent {
  final String confirmPassword;

  RegisterConfirmPassword({required this.confirmPassword});
}

class RegisterEmail extends RegisterEvent {
  final String email;

  RegisterEmail({required this.email});
}

class RegisterPhone extends RegisterEvent {
  final String phone;

  RegisterPhone({required this.phone});
}

class RegisterToggleObscureText extends RegisterEvent {
  final bool isPassword;

  RegisterToggleObscureText({required this.isPassword});
}

class RegisterToggleConfirmObscureText extends RegisterEvent {
  final bool isConfirmPassword;

  RegisterToggleConfirmObscureText({required this.isConfirmPassword});
}

class ToggleCheckbox extends RegisterEvent {
  final bool isChecked;

  ToggleCheckbox({required this.isChecked});
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  RegisterSubmitted(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
}
