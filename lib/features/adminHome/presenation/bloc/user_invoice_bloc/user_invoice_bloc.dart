import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/adminHome/presenation/bloc/user_invoice_bloc/user_invoice_event.dart';
import 'package:thalj/features/adminHome/presenation/bloc/user_invoice_bloc/user_invoice_state.dart';

import '../../../domain/repository.dart';


class UserInvoiceBloc extends Bloc<UserInvoiceEvent, UserInvoiceState> {
  final AdminRepository adminRepository;

  UserInvoiceBloc({required this.adminRepository}) : super(UserInvoiceInitial()) {
    on<FetchUserInvoices>(_onFetchUserInvoices);
    on<AccUserInvoice>(_accUserInvoice);
  }

  static UserInvoiceBloc get(context) => BlocProvider.of(context);

  Future<void> _onFetchUserInvoices(
      FetchUserInvoices event, Emitter<UserInvoiceState> emit) async {
    // ignore: unnecessary_type_check
    if (event is FetchUserInvoices) {
      emit(UserInvoiceLoading());
      var result = await adminRepository.getInvoicesForUsers();
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
      bool isAcc= await adminRepository.accInvoiceUser(event.invoiceID,event.orderID);
      if(isAcc ){
        emit(AccUserInvoiceLoaded("Success"));
        var result = await adminRepository.getInvoicesForUsers();
        emit(UserInvoiceLoaded(result));
        if(result.isEmpty){
          emit(UserInvoiceError('error'));

        }

      }else{
        emit(AccUserInvoiceError('error'));
      }
    }

  }
}
