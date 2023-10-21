abstract class UserInvoiceEvent {}

class FetchUserInvoices extends UserInvoiceEvent {}

class AccUserInvoice extends UserInvoiceEvent {
  final String orderID;
  final String invoiceID;
  AccUserInvoice(this.invoiceID,this.orderID);
}