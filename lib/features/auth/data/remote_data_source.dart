import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/functions/saveTokens.dart';
import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/toast.dart';
import '../domain/models/admin_model.dart';
import '../domain/models/login_model.dart';
import '../domain/models/register_model.dart';

class AuthRemoteDataSource {
  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/login'),
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

          var loginModel = LoginModel(
              id: loginData['id'],
              fullName: loginData['fullname'],
              phone: loginData['phone'],
              email: loginData['email'],
              proofOfIdentityFront: loginData['proofOfIdentityFront'],
              proofOfIdentityBack: loginData['proofOfIdentityBack'],
              residenceCardFront: loginData['residenceCardFront'],
              residenceCardBack: loginData['residenceCardBack'],
              drivingLicense: loginData['drivingLicense'],
              vehicleLicense: loginData['vehicleLicense'],
              operatingCard: loginData['operatingCard'],
              transferDocument: loginData['transferDocument'],
              verified: loginData['verified'],
              token: jsonResponse['token']);
          TokenManager.saveLoginToken(loginModel);

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

  Future<bool> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    try {
      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/signup'),
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
          print(response.body);

          var registerModel = RegisterModel.fromJson({
            'data': {
              'id': registerData['id'],
              'fullname': registerData['fullname'],
              'phone': registerData['phone'],
              'email': registerData['email'],
            },
            'token': jsonResponse['token'],
          });
          TokenManager.saveRegisterToken(registerModel);
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
          Uri.parse('http://mircle50-001-site1.atempurl.com/users/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final adminLoginData = jsonResponse['data'][0];
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
