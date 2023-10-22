import '../data/remote_data/remote_data_source.dart';
import 'models/driver_subscription_model.dart';
import 'models/user_invoice_model.dart';

class SubscriptionInvoiceRepository {
  final SubscriptionsInvoiceRemoteDataSource subscriptionsRemoteDataSource;
  SubscriptionInvoiceRepository(this.subscriptionsRemoteDataSource);

  Future<List<DriverSubscriptionModel>> getSubscriptionsForDrivers() async {
    List<DriverSubscriptionModel> subscriptions =
        await subscriptionsRemoteDataSource.getDriverSubscriptions();
    return subscriptions;
  }

  Future<List<UserInvoiceModel>> getInvoicesForUsers() async {
    List<UserInvoiceModel> invoices =
        await subscriptionsRemoteDataSource.getUserInvoices();
    return invoices;
  }

  Future<bool> renewDriverSubscription(String id) async {
    bool isAcc = await subscriptionsRemoteDataSource.renewDrivers(id);
    return isAcc;
  }

  Future<bool> accInvoiceUser(String invoiceId, String orderId) async {
    bool isAcc = await subscriptionsRemoteDataSource.renewUsersInvoices(
        invoiceId, orderId);
    return isAcc;
  }
}
