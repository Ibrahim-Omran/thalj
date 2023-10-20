




import '../../../domain/models/accepted_OrderModel.dart';

abstract class AcceptedOrdersState {}

class GetOrdersDataInitial extends AcceptedOrdersState {}

class GetOrdersDataLoading extends AcceptedOrdersState {}

class GetOrdersDataSuccess extends AcceptedOrdersState {
  final List<AcceptedOrdersModel> ordersData;

  GetOrdersDataSuccess(this.ordersData);
}

class GetOrdersDataFailure extends AcceptedOrdersState {
  final String errorMessage;

  GetOrdersDataFailure(this.errorMessage);
}