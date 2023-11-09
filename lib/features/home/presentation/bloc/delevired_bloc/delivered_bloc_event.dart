abstract class DeliveredOfferEvent {}







class DeliveredOfferSubmitted extends DeliveredOfferEvent {

  final String id;

  DeliveredOfferSubmitted({ required this.id});
}