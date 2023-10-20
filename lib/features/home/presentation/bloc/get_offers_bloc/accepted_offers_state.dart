part of 'accepted_offers_bloc.dart';

@immutable
abstract class GetAcceptedOrdersState {}

class GetOrdersDataInitial extends GetAcceptedOrdersState {}

class GetOrdersDataLoading extends GetAcceptedOrdersState {}

class GetOrdersDataSuccess extends GetAcceptedOrdersState {
  final List<AcceptedOrdersModel> ordersData;

  GetOrdersDataSuccess(this.ordersData);
}

class GetOrdersDataFailure extends GetAcceptedOrdersState {
  final String errorMessage;

  GetOrdersDataFailure(this.errorMessage);
}
