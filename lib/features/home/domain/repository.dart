import 'dart:io';



import '../../../core/errors/internetCheck.dart';
import '../../../core/functions/result.dart';

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
    await NetworkInfoImpl().checkInternet();

    bool isSendOffer = false;

    isSendOffer = await homeRemoteDataSource.sendOffer(
      name: name,
      phone: phone,
      price: price,
      id:id
    );
    return isSendOffer;
  }


  Future<bool> deliveredOffer({

    required String id,
  }) async {
    await NetworkInfoImpl().checkInternet();

    bool delivered = false;
    delivered = await homeRemoteDataSource.deliveredOffer(

        id:id
    );


    return delivered;
  }

  Future<Result<List<AcceptedOrdersModel>>> getOffer() async {
    await NetworkInfoImpl().checkInternet();

    try{
      Result<List<AcceptedOrdersModel>> ordersResult =
      await homeRemoteDataSource.getAcceptedOffers();
      return ordersResult;
    } catch(e){
      return Result.failure("An error occurred");
    }
  }



  Future<Result<List<OrdersModel>>> getOrders() async {
    await NetworkInfoImpl().checkInternet();

    try{
     Result<List<OrdersModel>> ordersResult =
     await homeRemoteDataSource.getDriversOrders();
     return ordersResult;
   } catch(e){
     return Result.failure("An error occurred");
   }


  }

  Future<bool> paySubscription({required File billPhoto,
  }) async {
    await NetworkInfoImpl().checkInternet();

    bool isPaid = await homeRemoteDataSource.paySubscription(billPhoto: billPhoto);
    return isPaid;
  }

  Future<OneOrderModel> getOneOrdersInfo(String id) async {
    await NetworkInfoImpl().checkInternet();

    OneOrderModel oneOrdersData = await homeRemoteDataSource.getDriversOneOrderInfo(id);

    return oneOrdersData;

  }


  Future<bool> editName({
    required String name,

  }) async {
    await NetworkInfoImpl().checkInternet();

    bool isEdit = false;

    isEdit = await homeRemoteDataSource.editName(
        name: name,


    );
    return isEdit;
  }


Future<bool> editEmail({
  required String email,

}) async {
  await NetworkInfoImpl().checkInternet();

  bool isSEdit = false;

  isSEdit= await homeRemoteDataSource.editEmail(
    email: email,


  );
  return isSEdit;
}



  Future<bool> editPhone({
    required String phone,

  }) async {
    await NetworkInfoImpl().checkInternet();

    bool isSEdit = false;

    isSEdit = await homeRemoteDataSource.editPhone(
    phone: phone,


    );
    return isSEdit;
  }

  Future<bool> editPass({
    required String password,

  }) async {
    await NetworkInfoImpl().checkInternet();

    bool isSEdit = false;

    isSEdit = await homeRemoteDataSource.editPassword(
      password: password,


    );
    return isSEdit;
  }
}





