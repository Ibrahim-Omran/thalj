part of 'send_bloc.dart';

@immutable
abstract class SendEvent {}
class SendName extends SendEvent{
  final String name;

  SendName(this.name);
}
class SendPrice extends SendEvent{
  final String price;

  SendPrice(this.price);
}
class SendPhone extends SendEvent{
  final String phone;

  SendPhone(this.phone);
}
class SendSubmitted extends SendEvent{
  final String name;
  final String phone;
  final String price;

  SendSubmitted(this.name, this.phone, this.price);
}