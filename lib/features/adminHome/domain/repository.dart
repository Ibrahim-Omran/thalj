


import '../../../core/errors/internetCheck.dart';

import 'models/drivers_model.dart';
import '../data/remote_data/remote_data_source.dart';
import 'models/driver_subscription_model.dart';
import 'models/user_invoice_model.dart';

class AdminRepository {
  final AdminRemoteDataSource adminRemoteDataSource;
  AdminRepository(this.adminRemoteDataSource);

  Future<List<DriversModel>> getDrivers() async {
    await NetworkInfoImpl().checkInternet();

    List<DriversModel> data = await adminRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    await NetworkInfoImpl().checkInternet();

    bool isAccepted = await adminRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }

  Future<bool> refuse(String id) async {
    await NetworkInfoImpl().checkInternet();

    bool isRefused = await adminRemoteDataSource.refuseDrivers(id);
    return isRefused;
  }
  Future<List<DriverSubscriptionModel>> getSubscriptionsForDrivers() async {
    await NetworkInfoImpl().checkInternet();

    List<DriverSubscriptionModel> subscriptions =
        await adminRemoteDataSource.getDriverSubscriptions();
    return subscriptions;
  }

  Future<List<UserInvoiceModel>> getInvoicesForUsers() async {
    await NetworkInfoImpl().checkInternet();

    List<UserInvoiceModel> invoices =
        await adminRemoteDataSource.getUserInvoices();
    return invoices;
  }

  Future<bool> renewDriverSubscription(String id) async {
    await NetworkInfoImpl().checkInternet();

    bool isAcc =
    await adminRemoteDataSource.renewDrivers(id);
    return isAcc;
  }

  Future<bool> accInvoiceUser(String invoiceId, String orderId) async {
    await NetworkInfoImpl().checkInternet();

    bool isAcc =
    await adminRemoteDataSource.renewUsersInvoices(invoiceId,orderId);
    return isAcc;
  }
}
