import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/local/cash_helper.dart';
import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';
import '../domain/models/admin_model.dart';
import '../domain/models/register_model.dart';

class AuthRemoteDataSource {
  Future<bool> login({required String email, required String password}) async {

    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Login successful
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {

          final loginData = jsonResponse['data'][0];
          final token = jsonResponse['token'];
          CacheHelper.saveData(
              key: 'loginToken', value:token );
          CacheHelper.saveData(
              key: 'name', value:loginData['fullname'] );
          CacheHelper.saveData(
              key: 'verified', value:loginData['verified'] );
          CacheHelper.saveData(
              key: 'status', value:loginData['status'] );
          CacheHelper.saveData(
              key: 'email', value:loginData['email'] );

          CacheHelper.saveData(
              key: 'phone', value:loginData['phone'] );


          return true;
        } else {
          // Handle missing or empty data
          if (kDebugMode) {
            print('No data found in response');
          }
          return false;
        }
      } else {
        // Login failed
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

  Future<bool> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {

    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/signup'),
        body: {
          'fullname': name,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        // Register successful
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final registerData = jsonResponse['data'];
          CacheHelper.saveData(
              key: 'registerToken', value: jsonResponse['token']);


         RegisterModel.fromJson({
            'data': {
              'id': registerData['id'],
              'fullname': registerData['fullname'],
              'phone': registerData['phone'],
              'email': registerData['email'],
            },
            'token': jsonResponse['token'],
          });
        }
        return true;
      } else {
        // register failed
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

  Future<bool> adminLogin(
      {required String email, required String password}) async {

    try {
      http.Response response = await http.post(
          Uri.parse('${AppStrings.apiLink}users/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final adminLoginData = jsonResponse['data'][0];
          CacheHelper.saveData(
              key: 'adminToken', value: jsonResponse['token']);
          AdminModel.fromJson({
            'id': adminLoginData['id'],
            'name': adminLoginData['name'],
            'phone': adminLoginData['phone'],
            'email': adminLoginData['email'],
            'image': adminLoginData['image'],
            'verified': adminLoginData['verified'],
            'token': jsonResponse['token'],
          });

          return true;
        } else {
          if (kDebugMode) {
            print('No data found in response');
          }
          return false;
        }
      } else {
        // Login failed
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
