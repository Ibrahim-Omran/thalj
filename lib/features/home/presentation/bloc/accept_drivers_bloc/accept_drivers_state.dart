part of 'accept_drivers_bloc.dart';

@immutable
sealed class AcceptDriversState {}

final class AcceptDriversInitial extends AcceptDriversState {}

final class AcceptDriversLoading extends AcceptDriversState {}

final class AcceptDriversSuccess extends AcceptDriversState {
  final String msg;

  AcceptDriversSuccess(this.msg);
}

final class AcceptDriversFailure extends AcceptDriversState {
  final String errorMessage;

  AcceptDriversFailure(this.errorMessage);
}
