part of 'accept_refuse_drivers_bloc.dart';

@immutable
sealed class AcceptRefuseDriversState {}

final class AcceptDriversInitial extends AcceptRefuseDriversState {}

final class AcceptRefuseDriversLoading extends AcceptRefuseDriversState {}

final class AcceptDriversSuccess extends AcceptRefuseDriversState {
  final String msg;

  AcceptDriversSuccess(this.msg);
}

final class AcceptDriversFailure extends AcceptRefuseDriversState {
  final String errorMessage;

  AcceptDriversFailure(this.errorMessage);
}

final class RefuseDriversSuccess extends AcceptRefuseDriversState {
  final String msg;

  RefuseDriversSuccess(this.msg);
}

final class RefuseDriversFailure extends AcceptRefuseDriversState {
  final String errorMessage;

  RefuseDriversFailure(this.errorMessage);
}
