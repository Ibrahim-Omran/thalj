import 'dart:io';


import '../data/remote_data_source.dart';
import 'models/accepted_OrderModel.dart';
import 'models/one_order_model.dart';
import 'models/orders_model.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepository(
    this.homeRemoteDataSource,
  );

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
    required String id,
  }) async {
    bool isSendOffer = false;

    isSendOffer = await homeRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
      id:id
    );
    return isSendOffer;
  }

  Future<List<AcceptedOrdersModel>> getOffer() async {
    List<AcceptedOrdersModel> data =
        await homeRemoteDataSource.getAcceptedOffers();
    return data;
  }



  Future<List<OrdersModel>> getOrders() async {
    List<OrdersModel> ordersData =
        await homeRemoteDataSource.getDriversOrders();

    return ordersData;
  }

  Future<bool> paySubscription({required File billPhoto,
  }) async {
    bool isPaid = await homeRemoteDataSource.paySubscription(billPhoto: billPhoto);
    return isPaid;
  }

  Future<OneOrderModel> getOneOrdersInfo(String id) async {
    OneOrderModel oneOrdersData = await homeRemoteDataSource.getDriversOneOrderInfo(id);

    return oneOrdersData;

  }
}



