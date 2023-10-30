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

class EditInfoSubmitted extends EditInfoEvent {
  final String name;
  final String phone;
  final String email;


  EditInfoSubmitted({required this.name, required this.phone, required this.email, });
}
