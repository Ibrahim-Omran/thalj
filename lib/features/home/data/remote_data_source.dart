import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';
import '../../../core/functions/saveDriverToken.dart';
import '../domain/models/AcceptedOrders.dart';

class OffersRemoteDataSource {
  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
  }) async {
    try {
      String? token = TokenManager.getToken();

      print(token);
      final response = await http.post(
        //Todo pass the id order from get order API
        Uri.parse('http://mircle50-001-site1.atempurl.com/offers/cXq77QlCmJ'),

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

  Future<List<AcceptedOrdersModel>> getOffers() async {
    String? token = TokenManager.getToken();
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

}
