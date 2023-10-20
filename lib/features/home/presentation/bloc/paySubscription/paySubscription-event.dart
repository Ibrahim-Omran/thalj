
import 'dart:io';

abstract class PaySubscriptionEvent {}

class PaySubscriptionInitialState extends PaySubscriptionEvent {}

class PaySubscriptionUpload extends PaySubscriptionEvent {
  final File billPhoto;


  PaySubscriptionUpload(
      {required this.billPhoto});
}
