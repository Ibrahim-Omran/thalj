import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:thalj/features/auth/domain/models/login_model.dart';

import '../../../core/local/cash_helper.dart';
import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';
import '../domain/models/admin_model.dart';
import '../domain/models/register_model.dart';

class AuthRemoteDataSource {
  Future<LoginModel?> login(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final loginModel = LoginModel.fromJson(jsonResponse);

          CacheHelper.saveData(key: 'loginToken', value: loginModel.token);
          CacheHelper.saveData(
              key: 'fullname', value: loginModel.data[0].fullname);
          CacheHelper.saveData(key: 'email', value: loginModel.data[0].email);
          CacheHelper.saveData(key: 'phone', value: loginModel.data[0].phone);
          CacheHelper.saveData(
              key: 'subscriptionDate',
              value: loginModel.data[0].subscriptionDate);
          CacheHelper.saveData(key: 'status', value: loginModel.data[0].status);
          CacheHelper.saveData(
              key: 'daysUntilExpiry', value: loginModel.daysUntilExpiry);

          return loginModel;
        } else {
          if (kDebugMode) {
            print('No data found in response');
          }
          return null;
        }
      } else {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(
          text: errorMessageModel.statusMessage,
          state: ToastStates.error,
        );
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return null;
    }
  }

  Future<RegisterModel?> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String bankName,
    required String interAccNum,
    required String accNum,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/signup'),
        body: {
          'fullname': name,
          'email': email,
          'password': password,
          'phone': phone,
          "bankName": bankName,
          "internationalAccountNum": interAccNum,
          "accountNumber": accNum
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Register successful
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final registerData = jsonResponse['data'];

          final registerModel = RegisterModel.fromJson({
            'data': {
              'id': registerData['id'],
              'fullname': registerData['fullname'],
              'phone': registerData['phone'],
              'email': registerData['email'],
            },
            'token': jsonResponse['token'],
          });

          CacheHelper.saveData(
              key: 'registerToken', value: jsonResponse['token']);

          return registerModel;
        }
      } else {
        // Register failed
        if (kDebugMode) {
          print(response.statusCode);
          print(response.body);
        }
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

    // Return null in case of failure or error
    return null;
  }

  Future<AdminModel?> adminLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}users/login'),
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          final adminLoginData = jsonResponse['data'][0];
          CacheHelper.saveData(key: 'adminToken', value: jsonResponse['token']);

          final adminModel = AdminModel.fromJson({
            'id': adminLoginData['id'],
            'name': adminLoginData['name'],
            'phone': adminLoginData['phone'],
            'email': adminLoginData['email'],
            'image': adminLoginData['image'],
            'verified': adminLoginData['verified'],
            'token': jsonResponse['token'],
          });

          return adminModel;
        }
      } else {
        // Login failed
        if (kDebugMode) {
          print(response.body);
        }
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

    return null;
  }

  Future<bool> sendOTPToEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse(
          '${AppStrings.apiLink}drivers/resend-otp',
        ),
        body: ({'email': email}),
      );
      if (kDebugMode) {
        print(email);
      }
      if (response.statusCode == 201) {
        if (kDebugMode) {
          print(response.body);
        }

        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }

        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            "otpppp To Mail failed code: ${e.hashCode} runtime${e.runtimeType}");
      }
      return false;
    }
  }

  Future<bool> sendOTPWithEmail(String email, String otp) async {
    try {
      var registerToken = CacheHelper.getData(key: 'registerToken');
      if (kDebugMode) {
        print('register Token $registerToken');
      }
      final response =
          await http.post(Uri.parse('${AppStrings.apiLink}drivers/verify'),
              body: jsonEncode({
                "email": email,
                "otp": otp,
              }),
              headers: {
            "Content-Type": "application/json",
            'Accept': '*/*',
            'Authorization': 'Bearer $registerToken',
          });
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }

        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            "otpppp With Mail failed code: ${e.hashCode} runtime${e.runtimeType} ");
      }
      return false;
    }
  }

  Future<bool> sendOTPToEmailReset(String email) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/resetPassOTP'),
        body: {"email": email},
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }

        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            "otpppp To Mail Reset failed code: ${e.hashCode} runtime${e.runtimeType}");
      }
      return false;
    }
  }

  Future<bool> sendOTPResetPass(String email, String otp, String pass) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}drivers/resetPassVerify'),
        body: {
          'email': email,
          "otp": otp,
          "newPass": pass,
        },
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return true;
      } else {
        if (kDebugMode) {
          print(response.body);
        }

        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            "otpppp Reset Pass failed code: ${e.hashCode} runtime${e.runtimeType}");
      }
      return false;
    }
  }
}
