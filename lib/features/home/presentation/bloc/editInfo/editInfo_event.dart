abstract class EditInfoEvent {}

class EditInfoName extends EditInfoEvent {
  final String name;

  EditInfoName(this.name);
}

class EditInfoPrice extends EditInfoEvent {
  final String email;

  EditInfoPrice(this.email);
}

class EditInfoPhone extends EditInfoEvent {
  final String phone;

  EditInfoPhone(this.phone);
}

class EditToggleObscureText extends EditInfoEvent {
  final bool isPassword;

  EditToggleObscureText({required this.isPassword});
}

class EditToggleConfirmedObscureText extends EditInfoEvent {
  final bool isConfirmedPassword;

  EditToggleConfirmedObscureText({required this.isConfirmedPassword});
}

class EditNameSubmitted extends EditInfoEvent {
  final String name;



  EditNameSubmitted({required this.name });
}

class EditEmailSubmitted extends EditInfoEvent {
  final String email;



  EditEmailSubmitted({required this.email });
}

class EditPhoneSubmitted extends EditInfoEvent {
  final String phone;



  EditPhoneSubmitted({required this.phone });
}

class EditPasswordSubmitted extends EditInfoEvent {
  final String password;



  EditPasswordSubmitted({required this.password });
}
