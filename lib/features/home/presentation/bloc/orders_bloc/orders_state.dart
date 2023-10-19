import '../../../domain/models/orders_model.dart';

import 'package:meta/meta.dart';

@immutable
abstract class GetOrdersDataState {}

class GetOrdersDataInitial extends GetOrdersDataState {}

class GetOrdersDataLoading extends GetOrdersDataState {}

class GetOrdersDataSuccess extends GetOrdersDataState {
  final List<OrdersModel> ordersData;

  GetOrdersDataSuccess(this.ordersData);
}

class GetOrdersDataFailure extends GetOrdersDataState {
  final String errorMessage;

  GetOrdersDataFailure(this.errorMessage);
}