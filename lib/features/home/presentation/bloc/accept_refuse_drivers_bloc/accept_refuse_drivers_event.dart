part of 'accept_refuse_drivers_bloc.dart';

@immutable
sealed class AcceptRefuseDriversEvent {}

class AcceptDrivers extends AcceptRefuseDriversEvent {
  final String driverId;

  AcceptDrivers({required this.driverId});
}

class RefuseDrivers extends AcceptRefuseDriversEvent {
  final String driverId;

  RefuseDrivers({required this.driverId});
}
