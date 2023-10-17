part of 'get_drivers_data_bloc.dart';

@immutable
sealed class GetDriversDataState {}

final class GetDriversDataInitial extends GetDriversDataState {}

final class GetDriversDataLoading extends GetDriversDataState {}

final class GetDriversDataSuccess extends GetDriversDataState {
  final List<DriversModel> driversData;

  GetDriversDataSuccess(this.driversData);
}

final class GetDriversDataFailure extends GetDriversDataState {
  final String errorMessage;

  GetDriversDataFailure(this.errorMessage);
}
