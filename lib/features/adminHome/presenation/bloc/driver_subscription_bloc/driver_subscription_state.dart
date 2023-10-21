
import '../../../domain/models/driver_subscription_model.dart';

abstract class DriverSubscriptionState {}

class DriverSubscriptionInitial extends DriverSubscriptionState {}

class DriverSubscriptionLoading extends DriverSubscriptionState {}

class DriverSubscriptionLoaded extends DriverSubscriptionState {
  final List<DriverSubscriptionModel> driverSubscriptions;

  DriverSubscriptionLoaded(this.driverSubscriptions);
}

class DriverSubscriptionError extends DriverSubscriptionState {
  final String errorMessage;

  DriverSubscriptionError(this.errorMessage);
}



class AccSubscriptionLoading extends DriverSubscriptionState {}

class AccDriverSubscriptionLoaded extends DriverSubscriptionState {
  final String accDriverSubscriptions;

  AccDriverSubscriptionLoaded(this.accDriverSubscriptions);
}

class AccDriverSubscriptionError extends DriverSubscriptionState {
  final String errorMessage;

  AccDriverSubscriptionError(this.errorMessage);
}