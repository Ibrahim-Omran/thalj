

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';
import 'models/drivers_model.dart';
import '../data/remote_data/remote_data_source.dart';
import 'models/driver_subscription_model.dart';
import 'models/user_invoice_model.dart';

class AdminRepository {
  final AdminRemoteDataSource adminRemoteDataSource;
  AdminRepository(this.adminRemoteDataSource);
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<List<DriversModel>> getDrivers() async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<DriversModel> data = await adminRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isAccepted = await adminRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }

  Future<bool> refuse(String id) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isRefused = await adminRemoteDataSource.refuseDrivers(id);
    return isRefused;
  }
  Future<List<DriverSubscriptionModel>> getSubscriptionsForDrivers() async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<DriverSubscriptionModel> subscriptions =
        await adminRemoteDataSource.getDriverSubscriptions();
    return subscriptions;
  }

  Future<List<UserInvoiceModel>> getInvoicesForUsers() async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    List<UserInvoiceModel> invoices =
        await adminRemoteDataSource.getUserInvoices();
    return invoices;
  }

  Future<bool> renewDriverSubscription(String id) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isAcc =
    await adminRemoteDataSource.renewDrivers(id);
    return isAcc;
  }

  Future<bool> accInvoiceUser(String invoiceId, String orderId) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isAcc =
    await adminRemoteDataSource.renewUsersInvoices(invoiceId,orderId);
    return isAcc;
  }
}
