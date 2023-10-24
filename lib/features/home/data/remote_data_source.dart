import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/features/home/domain/models/orders_model.dart';

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';
import '../../../core/functions/saveDataManager.dart';
import '../../../core/utils/app_strings.dart';
import '../domain/models/accepted_OrderModel.dart';
import '../domain/models/one_order_model.dart';

class HomeRemoteDataSource {
  String? token = SaveDataManager.getLoginToken();

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

      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}offers/$id'),
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
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    final response = await http.get(
        Uri.parse('${AppStrings.apiLink}drivers/orders'),
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



  Future<List<OrdersModel>> getDriversOrders() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    var response = await http.get(
      Uri.parse('${AppStrings.apiLink}orders'),
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
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    final response = await http.get(
      Uri.parse('${AppStrings.apiLink}orders/$id'),
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

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppStrings.apiLink}drivers/paySubscription'),
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
