import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';



class SendData {
  Future<bool> send({required String name, required String price,required String phone}) async {
    try {
      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/offers/Q15sQ2I1N1'),
        body: {
          'fullName':name,
          'price': price,
          'phone': phone,
        },
      );

      if (response.statusCode == 200) {
        // sent successful
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        // register failed
        if (kDebugMode) {
          print(response.body);
        }
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(text: errorMessageModel.statusMessage, state: ToastStates.error);
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