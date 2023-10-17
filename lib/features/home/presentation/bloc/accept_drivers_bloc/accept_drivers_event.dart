part of 'accept_drivers_bloc.dart';

@immutable
sealed class AcceptDriversEvent {}

class AcceptDrivers extends AcceptDriversEvent {
  final String driverId;

  AcceptDrivers({required this.driverId});
}
