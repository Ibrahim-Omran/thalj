import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:thalj/features/home/domain/models/drivers_model.dart';
import 'package:thalj/features/home/domain/models/orders_model.dart';

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';
import '../../../core/functions/saveTokens.dart';
import '../domain/models/accepted_OrderModel.dart';

class DriverRemoteDataSource {
  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    try {
      String? token = TokenManager.getLoginToken();

      print(token);
      final response = await http.post(
        //Todo pass the id order from get order API
        Uri.parse('http://mircle50-001-site1.atempurl.com/offers/gTDz1FlGJB'),

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
    String? token = TokenManager.getLoginToken();
    print(token);
    final response = await http.get(
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });
    List<AcceptedOrdersModel> orderData=[];
    try {
      if(response.statusCode==200){
        print(response.body);
        final data =jsonDecode(response.body);
        for(var i in data){
          orderData.add(AcceptedOrdersModel.fromJson(i));
        }
        print(orderData.first.name);
      }else{
        print(response.body);
        final Map<String ,dynamic>jsonResponse=jsonDecode(response.body);
        final errorMessageModel=ErrorMessageModel.fromJson(jsonResponse);
        showToast(text: errorMessageModel.statusMessage, state: ToastStates.error);
      }

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }

    }
    return orderData;
  }



  Future<List<DriversModel>> getDriversData() async {
    String? token = TokenManager.getAdminToken();
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
      print(drivers);
    } else {
      print(data.statusCode);
    }
    return drivers;
  }

  Future<bool> acceptDrivers(String id) async {
    String? token = TokenManager.getAdminToken();


    var data = await http.patch(
        Uri.parse('http://mircle50-001-site1.atempurl.com/dashboard/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });

    if (data.statusCode == 200) {
      print(data.body);
      return true;
    } else {
      print(data.statusCode);
      return false;
    }
  }


  Future <List<OrdersModel>> getDriversOrders() async {
    String? token = TokenManager.getLoginToken();

    var response = await http.get(
      Uri.parse('http://mircle50-001-site1.atempurl.com/orders'),
      headers: {
        "Content-Type": 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );
    List<OrdersModel> ordersData=[];

    try{
      if (response.statusCode == 200) {
        print(response.body);

        final data = jsonDecode(response.body);
        for(var item in data) {
          ordersData.add(OrdersModel.fromJson(item));

        }
        print(ordersData.first.name);
        print(ordersData.first.id);




      } else {
        print(response.body);
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(
            text: errorMessageModel.statusMessage, state: ToastStates.error);


        print("erorr");
      }
    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return ordersData;

  }


  Future<dynamic> getDriversOneOrder(String orderId) async {
    final response = await http.get(
      Uri.parse('http://mircle50-001-site1.atempurl.com/orders/$orderId'),
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOlt7ImlkIjoiLVF6SGo5cUliTCJ9XSwiaWF0IjoxNjk2NzcyODU0LCJleHAiOjE2OTkzNjQ4NTR9.ixzP-pVy_Xx3rZxuOvXuq9EgANHT_1mAQjJxH4rKQLw',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to retrieve order');
    }
  }





}


