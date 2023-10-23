

import 'models/drivers_model.dart';
import '../data/remote_data/remote_data_source.dart';
import 'models/driver_subscription_model.dart';
import 'models/user_invoice_model.dart';

class AdminRepository {
  final AdminRemoteDataSource adminRemoteDataSource;
  AdminRepository(this.adminRemoteDataSource);
  Future<List<DriversModel>> getDrivers() async {
    List<DriversModel> data = await adminRemoteDataSource.getDriversData();

    return data;
  }

  Future<bool> acceptance(String id) async {
    bool isAccepted = await adminRemoteDataSource.acceptDrivers(id);
    return isAccepted;
  }

  Future<bool> refuse(String id) async {
    bool isRefused = await adminRemoteDataSource.refuseDrivers(id);
    return isRefused;
  }
  Future<List<DriverSubscriptionModel>> getSubscriptionsForDrivers() async {
    List<DriverSubscriptionModel> subscriptions =
        await adminRemoteDataSource.getDriverSubscriptions();
    return subscriptions;
  }

  Future<List<UserInvoiceModel>> getInvoicesForUsers() async {
    List<UserInvoiceModel> invoices =
        await adminRemoteDataSource.getUserInvoices();
    return invoices;
  }

  Future<bool> renewDriverSubscription(String id) async {
    bool isAcc =
    await adminRemoteDataSource.renewDrivers(id);
    return isAcc;
  }

  Future<bool> accInvoiceUser(String invoiceId, String orderId) async {
    bool isAcc =
    await adminRemoteDataSource.renewUsersInvoices(invoiceId,orderId);
    return isAcc;
  }
}
