
abstract class DriverSubscriptionEvent {}

class FetchDriverSubscriptions extends DriverSubscriptionEvent {}
class AccDriverSubscriptions extends DriverSubscriptionEvent {
  final String billID;
  AccDriverSubscriptions(this.billID);
}

