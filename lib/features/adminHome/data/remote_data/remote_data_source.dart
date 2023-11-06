import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/local/cash_helper.dart';
import '../../../../core/network/ErrorModel.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../domain/models/drivers_model.dart';
import '../../domain/models/driver_subscription_model.dart';
import '../../domain/models/user_invoice_model.dart';


class AdminRemoteDataSource {
  String? adminToken = CacheHelper.getData(key: 'adminToken');


  Future<List<DriverSubscriptionModel>> getDriverSubscriptions() async {

    List<DriverSubscriptionModel> driverSubscriptions = [];
    try {
      http.Response response = await http.get(
          Uri.parse(
              '${AppStrings.apiLink}dashboard/invoices'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $adminToken',
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

    List<UserInvoiceModel> userSubscriptions = [];
    try {
      http.Response response = await http.get(
          Uri.parse('http://mircle50-001-site1.atempurl.com/payment/invoices'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization': 'Bearer $adminToken',
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


    var data = await http.post(
        Uri.parse(
            'http://mircle50-001-site1.atempurl.com/dashboard/renewDriver/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $adminToken',
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


    var data = await http.post(
        Uri.parse(
            'http://mircle50-001-site1.atempurl.com/payment/accept/$invoiceId/$orderId'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $adminToken',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم قبول الفاترة", state: ToastStates.success);
      return true;
    } else {

      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }

  Future<List<DriversModel>> getDriversData() async {

    var data = await http.get(
        Uri.parse('http://mircle50-001-site1.atempurl.com/dashboard'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $adminToken',
        });
    List<DriversModel> drivers = [];
    if (data.statusCode == 200) {
      var jsonData = jsonDecode(data.body);
      for (var item in jsonData) {
        drivers.add(DriversModel.fromMap(item));
      }
    } else {
    }
    return drivers;
  }

  Future<bool> acceptDrivers(String id) async {




    var data = await http.patch(
        Uri.parse('${AppStrings.apiLink}dashboard/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $adminToken',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم قبول السائق", state: ToastStates.success);
      return true;
    } else {
      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }




  Future<bool> refuseDrivers(String id) async {

    var data = await http.delete(
        Uri.parse('${AppStrings.apiLink}dashboard/$id'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $adminToken',
        });

    if (data.statusCode == 200) {
      showToast(text: "تم رفض السائق", state: ToastStates.success);

      return true;
    } else {
      showToast(text: "برجاء المحاولة لاحقا", state: ToastStates.error);

      return false;
    }
  }
}
