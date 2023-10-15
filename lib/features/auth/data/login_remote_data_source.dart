import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/errors/Exceptions.dart';
import '../../../core/network/ErrorModel.dart';
import '../../../core/utils/toast.dart';



class LoginRemoteDataSource {
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
        print(response.body);
        return true;
      } else {
        // Login failed
        print(response.body);
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        showToast(text: errorMessageModel.statusMessage, state: ToastStates.error);
        throw ServerExceptions(errorMessageModel: errorMessageModel);
      }
    } catch (e) {
      rethrow;
    }
  }
}