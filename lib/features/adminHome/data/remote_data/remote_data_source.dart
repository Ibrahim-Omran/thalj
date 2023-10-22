import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/functions/saveDataManager.dart';
import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../domain/models/driver_subscription_model.dart';
import '../../domain/models/user_invoice_model.dart';

String? token = SaveDataManager.getAdminToken();

class SubscriptionsInvoiceRemoteDataSource {
  Future<List<DriverSubscriptionModel>> getDriverSubscriptions() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<DriverSubscriptionModel> driverSubscriptions = [];
    try {
      http.Response response = await http.get(
          Uri.parse(
              'http://mircle50-001-site1.atempurl.com/dashboard/invoices'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        if (jsonBody != null && response.body.isNotEmpty) {
          List<dynamic> data = jsonBody['data'];
          driverSubscriptions = data
              .map((item) => DriverSubscriptionModel.fromJson(item))
              .toList();
        } else {
          final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
          showToast(
              text: errorMessageModel.statusMessage, state: ToastStates.error);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return driverSubscriptions;
  }

  Future<List<UserInvoiceModel>> getUserInvoices() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<UserInvoiceModel> userSubscriptions = [];
    try {
      http.Response response = await http.get(
          Uri.parse('http://mircle50-001-site1.atempurl.com/payment/invoices'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        if (jsonBody != null && response.body.isNotEmpty) {
          List<dynamic> data = jsonBody['data'];
          userSubscriptions =
              data.map((item) => UserInvoiceModel.fromJson(item)).toList();
        } else {
          final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
          final errorMessageModel = ErrorMessageModel.fromJson(jsonResponse);
          showToast(
              text: errorMessageModel.statusMessage, state: ToastStates.error);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return userSubscriptions;
  }

  Future<bool> renewDrivers(String id) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }

    var data = await http.post(
        Uri.parse(
            'http://mircle50-001-site1.atempurl.com/dashboard/renewDriver/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم تجديد الاشتراك", state: ToastStates.success);
      return true;
    } else {
      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }

  Future<bool> renewUsersInvoices(String invoiceId, String orderId) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (!result) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }

    var data = await http.post(
        Uri.parse(
            'http://mircle50-001-site1.atempurl.com/payment/accept/$invoiceId/$orderId'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم قبول الفاترة", state: ToastStates.success);
      return true;
    } else {

      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }
}
