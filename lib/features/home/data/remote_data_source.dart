import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/features/home/domain/models/drivers_model.dart';
import 'package:thalj/features/home/domain/models/orders_model.dart';

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';
import '../../../core/functions/saveDataManager.dart';
import '../../../core/utils/app_strings.dart';
import '../domain/models/accepted_OrderModel.dart';
import '../domain/models/one_order_model.dart';

class DriverRemoteDataSource {
  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
    required String id,
  }) async {

    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }

    try {
      String? token = SaveDataManager.getLoginToken();

      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/offers/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          {
            'fullName': name,
            'price': price,
            'phoneNumber': phone,
          },
        ),
      );

      if (response.statusCode == 200) {
        // sent successful
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(
            text: errorMessageModel.statusMessage, state: ToastStates.error);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<List<AcceptedOrdersModel>> getAcceptedOffers() async {
    String? token = SaveDataManager.getLoginToken();
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    final response = await http.get(
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });
    List<AcceptedOrdersModel> orderData = [];
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var i in data) {
          orderData.add(AcceptedOrdersModel.fromJson(i));
        }
      } else {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(
            text: errorMessageModel.statusMessage, state: ToastStates.error);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return orderData;
  }

  Future<List<DriversModel>> getDriversData() async {
    String? token = SaveDataManager.getAdminToken();
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    var data = await http.get(
        Uri.parse('http://mircle50-001-site1.atempurl.com/dashboard'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });
    List<DriversModel> drivers = [];
    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      for (var item in jsonData) {
        drivers.add(DriversModel.fromMap(item));
      }
    } else {
    }
    return drivers;
  }

  Future<bool> acceptDrivers(String id) async {

    String? token = SaveDataManager.getAdminToken();

    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }

    var data = await http.patch(
        Uri.parse('http://mircle50-001-site1.atempurl.com/dashboard/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم قبول السائق", state: ToastStates.success);
      return true;
    } else {
      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }




  Future<bool> refuseDrivers(String id) async {
    String? token = SaveDataManager.getAdminToken();
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    var data = await http.delete(
        Uri.parse('http://mircle50-001-site1.atempurl.com/dashboard/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم رفض السائق", state: ToastStates.success);

      return true;
    } else {
      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }

  Future<List<OrdersModel>> getDriversOrders() async {
    String? token = SaveDataManager.getLoginToken();
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    var response = await http.get(
      Uri.parse('http://mircle50-001-site1.atempurl.com/orders'),
      headers: {
        "Content-Type": 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );
    List<OrdersModel> ordersData = [];

    try {
      if (response.statusCode == 200) {

        final data = jsonDecode(response.body);
        for (var item in data) {
          ordersData.add(OrdersModel.fromJson(item));
        }
      } else {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(
            text: errorMessageModel.statusMessage, state: ToastStates.error);

      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return ordersData;
  }

  Future<OneOrderModel> getDriversOneOrderInfo(String id) async {
    String? token = SaveDataManager.getLoginToken();
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    final response = await http.get(
      Uri.parse('http://mircle50-001-site1.atempurl.com/orders/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final  data = jsonDecode(response.body);
      return OneOrderModel.fromJson(data);

    } else {
      throw Exception('Failed to retrieve order');
    }
  }

  Future<bool> paySubscription({
    required File billPhoto,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    try {

      String? token = SaveDataManager.getLoginToken();
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/paySubscription'),
      );
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('file', billPhoto.path));
      var response = await request.send();
      if (response.statusCode == 200) {
        // sent successful
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        showToast(
            text: "تم استلام الفاتورة هيتم تفعيل الحساب بعد التحقق منها", state: ToastStates.success);
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }

        showToast(
            text: response.reasonPhrase!, state: ToastStates.error);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

}
