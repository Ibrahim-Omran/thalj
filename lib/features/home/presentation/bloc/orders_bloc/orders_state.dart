import '../../../domain/models/one_order_model.dart';
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


class GetOneOrdersDataInitial extends  GetOrdersDataState {}

class  GetOneOrdersDataLoading extends  GetOrdersDataState {}

class GetOneOrdersDataSuccess extends  GetOrdersDataState {
  final OneOrderModel ordersOneData;

  GetOneOrdersDataSuccess(this.ordersOneData);
}

class  GetOneOrdersDataFailure extends  GetOrdersDataState {
  final String errorMessage;

  GetOneOrdersDataFailure(this.errorMessage);
}