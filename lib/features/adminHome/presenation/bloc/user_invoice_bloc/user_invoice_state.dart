
import '../../../domain/models/user_invoice_model.dart';

abstract class UserInvoiceState {}

class UserInvoiceInitial extends UserInvoiceState {}

class UserInvoiceLoading extends UserInvoiceState {}

class UserInvoiceLoaded extends UserInvoiceState {
  final List<UserInvoiceModel> userInvoices;

  UserInvoiceLoaded(this.userInvoices);
}

class UserInvoiceError extends UserInvoiceState {
  final String errorMessage;

  UserInvoiceError(this.errorMessage);
}


class AccUserInvoiceLoading extends UserInvoiceState {}

class AccUserInvoiceLoaded extends UserInvoiceState {
  final String accUserInvoice;

  AccUserInvoiceLoaded(this.accUserInvoice);
}

class AccUserInvoiceError extends UserInvoiceState {
  final String errorMessage;

  AccUserInvoiceError(this.errorMessage);
}