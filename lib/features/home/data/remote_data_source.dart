import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:thalj/features/home/domain/models/orders_model.dart';

import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/toast.dart';
import '../../../core/functions/result.dart';
import '../../../core/local/cash_helper.dart';
import '../../../core/utils/app_strings.dart';
import '../domain/models/accepted_OrderModel.dart';
import '../domain/models/one_order_model.dart';

class HomeRemoteDataSource {
  String? loginToken = CacheHelper.getData(key: 'loginToken');

  Future<bool> sendOffer({
    required String name,
    required String price,
    required String phone,
    required String id,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppStrings.apiLink}offers/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
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

  Future<Result<List<AcceptedOrdersModel>>> getAcceptedOffers() async {
    final response = await http
        .get(Uri.parse('${AppStrings.apiLink}drivers/orders'), headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $loginToken',
    });
    List<AcceptedOrdersModel> orderData = [];
    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
          for (var item in data) {
            orderData.add(AcceptedOrdersModel.fromJson(item));
          }
          return Result.success(orderData);
        } else if (data is Map && data.containsKey("msg")) {
          final errorMessage = data["msg"];
          return Result.failure(errorMessage);
        }
      } else {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        return Result.failure(errorMessageModel.statusMessage);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return Result.failure("An error occurred");
  }

  Future<Result<List<OrdersModel>>> getDriversOrders() async {
    var response = await http.get(
      Uri.parse('${AppStrings.apiLink}orders'),
      headers: {
        "Content-Type": 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $loginToken',
      },
    );
    List<OrdersModel> ordersData = [];

    try {
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
          for (var item in data) {
            ordersData.add(OrdersModel.fromJson(item));
          }
          return Result.success(ordersData);
        } else if (data is Map && data.containsKey("msg")) {
          final errorMessage = data["msg"];
          return Result.failure(errorMessage);
        }
      } else {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
        return Result.failure(errorMessageModel.statusMessage);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return Result.failure("An error occurred");
  }

  Future<OneOrderModel> getDriversOneOrderInfo(String id) async {
    final response = await http.get(
      Uri.parse('${AppStrings.apiLink}orders/$id'),
      headers: {
        'Authorization': 'Bearer $loginToken',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return OneOrderModel.fromJson(data);
    } else {
      throw Exception('Failed to retrieve order');
    }
  }

  Future<bool> paySubscription({
    required File billPhoto,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${AppStrings.apiLink}drivers/paySubscription'),
      );
      request.headers['Authorization'] = 'Bearer $loginToken';
      request.files
          .add(await http.MultipartFile.fromPath('file', billPhoto.path));
      var response = await request.send();
      if (response.statusCode == 200) {
        // sent successful
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        showToast(
            text: "تم استلام الفاتورة سيتم تفعيل الحساب بعد التحقق منها",
            state: ToastStates.success);
        return true;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }

        showToast(text: response.reasonPhrase!, state: ToastStates.error);
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }

  Future<bool> editName({
    required String name,

  }) async {
    try {
      final response = await http.patch(
        Uri.parse('${AppStrings.apiLink}editProfile/driver'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
        },
        body: jsonEncode(
          {
            "fullname": name,

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
  Future<bool> editEmail({
    required String email,

  }) async {
    try {
      final response = await http.patch(
        Uri.parse('${AppStrings.apiLink}editProfile/driver'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
        },
        body: jsonEncode(
          {
            "email": email,


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

  Future<bool> editPhone({
    required String phone,

  }) async {
    try {
      final response = await http.patch(
        Uri.parse('${AppStrings.apiLink}editProfile/driver'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
        },
        body: jsonEncode(
          {
            "phone": phone,


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
  Future<bool> editPassword({
    required String password,

  }) async {
    try {
      final response = await http.patch(
        Uri.parse('${AppStrings.apiLink}editProfile/driver'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
        },
        body: jsonEncode(
          {
            "password": password,


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


  Future<bool> deliveredOffer({

    required String id,
  }) async {
    try {
      final response = await http.patch(
        Uri.parse('${AppStrings.apiLink}drivers/delevired/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $loginToken',
        },

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

}