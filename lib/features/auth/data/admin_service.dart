import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/toast.dart';
import '../domain/loginModel/admin_model.dart';

class AdminService {
  Future<bool> isAdmin({required String email, required String password}) async {
    try {
      http.Response response = await http.post(
          Uri.parse('http://mircle50-001-site1.atempurl.com/users/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final loginData = jsonResponse['data'][0];
          AdminModel.fromJson(loginData, jsonResponse['token']);
          return true;
        } else {
          if (kDebugMode) {
            print('No data found in response');
          }
          return false;
        }
      } else {
        // Login failed
        print(response.body);
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
}
