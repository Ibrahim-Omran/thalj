import 'dart:io';


import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/functions/result.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';
import '../data/remote_data_source.dart';
import 'models/accepted_OrderModel.dart';
import 'models/one_order_model.dart';
import 'models/orders_model.dart';

class HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepository(
    this.homeRemoteDataSource,
  );
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
    required String id,
  }) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
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
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<AcceptedOrdersModel> data =
        await homeRemoteDataSource.getAcceptedOffers();
    return data;
  }



  Future<Result<List<OrdersModel>>> getOrders() async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
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
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isPaid = await homeRemoteDataSource.paySubscription(billPhoto: billPhoto);
    return isPaid;
  }

  Future<OneOrderModel> getOneOrdersInfo(String id) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    OneOrderModel oneOrdersData = await homeRemoteDataSource.getDriversOneOrderInfo(id);

    return oneOrdersData;

  }


  Future<bool> editInfo({
    required String name,
    required String email,
    required String phone,
  }) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isSEditInfo = false;

    isSEditInfo = await homeRemoteDataSource.editInfo(
        name: name,
        phone: phone,
        email: email,

    );
    return isSEditInfo;
  }
}



