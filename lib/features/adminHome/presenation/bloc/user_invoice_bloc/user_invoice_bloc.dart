import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/adminHome/presenation/bloc/user_invoice_bloc/user_invoice_event.dart';
import 'package:thalj/features/adminHome/presenation/bloc/user_invoice_bloc/user_invoice_state.dart';

import '../../../domain/repository.dart';


class UserInvoiceBloc extends Bloc<UserInvoiceEvent, UserInvoiceState> {
  final SubscriptionInvoiceRepository repository;

  UserInvoiceBloc({required this.repository}) : super(UserInvoiceInitial()) {
    on<FetchUserInvoices>(_onFetchUserInvoices);
    on<AccUserInvoice>(_accUserInvoice);
  }

  static UserInvoiceBloc get(context) => BlocProvider.of(context);

  Future<void> _onFetchUserInvoices(
      FetchUserInvoices event, Emitter<UserInvoiceState> emit) async {
    // ignore: unnecessary_type_check
    if (event is FetchUserInvoices) {
      emit(UserInvoiceLoading());
      var result = await repository.getInvoicesForUsers();
      if (result.isNotEmpty) {
        emit(UserInvoiceLoaded(result));
      } else {
        emit(UserInvoiceError('error'));
      }
    }
  }



  Future<void> _accUserInvoice(
      AccUserInvoice event, Emitter<UserInvoiceState> emit) async {
    // ignore: unnecessary_type_check
    if(event is AccUserInvoice){
      emit(AccUserInvoiceLoading());
      bool isAcc= await repository.accInvoiceUser(event.invoiceID,event.orderID);
      if(isAcc ){
        emit(AccUserInvoiceLoaded("Success"));

      }else{
        emit(AccUserInvoiceError('error'));
      }
    }

  }
}
