import 'dart:io';

import 'package:thalj/features/home/domain/models/drivers_model.dart';

import '../data/remote_data_source.dart';
import 'models/accepted_OrderModel.dart';
import 'models/one_order_model.dart';
import 'models/orders_model.dart';

class DriverRepository {
  final DriverRemoteDataSource driverRemoteDataSource;
  DriverRepository(
    this.driverRemoteDataSource,
  );

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
    required String id,
  }) async {
    bool isSendOffer = false;

    isSendOffer = await driverRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
      id:id
    );
    return isSendOffer;
  }

  Future<List<AcceptedOrdersModel>> getOffer() async {
    List<AcceptedOrdersModel> data =
        await driverRemoteDataSource.getAcceptedOffers();
    return data;
  }

  Future<List<DriversModel>> getDrivers() async {
    List<DriversModel> data = await driverRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    bool isAccepted = await driverRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }

  Future<bool> refuse(String id) async {
    bool isRefused = await driverRemoteDataSource.refuseDrivers(id);
    return isRefused;
  }

  Future<List<OrdersModel>> getOrders() async {
    List<OrdersModel> ordersData =
        await driverRemoteDataSource.getDriversOrders();

    return ordersData;
  }

  Future<bool> paySubscription({required File billPhoto,
  }) async {
    bool isPaid = await driverRemoteDataSource.paySubscription(billPhoto: billPhoto);
    return isPaid;
  }

  Future<OneOrderModel> getOneOrdersInfo(String id) async {
    OneOrderModel oneOrdersData = await driverRemoteDataSource.getDriversOneOrderInfo(id);

    return oneOrdersData;

  }
}



