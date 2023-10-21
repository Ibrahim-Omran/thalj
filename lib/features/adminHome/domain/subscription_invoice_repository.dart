

import '../data/remote_data/subscription_invoice_remote_data_source.dart';
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
}
