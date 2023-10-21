abstract class SendOfferEvent {}

class SendOfferName extends SendOfferEvent {
  final String name;

  SendOfferName(this.name);
}

class SendOfferPrice extends SendOfferEvent {
  final String price;

  SendOfferPrice(this.price);
}

class SendOfferPhone extends SendOfferEvent {
  final String phone;

  SendOfferPhone(this.phone);
}

class SendOfferSubmitted extends SendOfferEvent {
  final String name;
  final String phone;
  final String price;
  final String id;

  SendOfferSubmitted({required this.name, required this.phone, required this.price, required this.id});
}
