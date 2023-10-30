import 'package:bloc/bloc.dart';

import '../../../../../core/network/ErrorModel.dart';
import '../../../domain/repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersApiException implements Exception {
  final String message;

  OrdersApiException(this.message);
}

class GetOrdersDataBloc extends Bloc<GetOrdersDataEvent, GetOrdersDataState> {
  final HomeRepository homeRepository;


  GetOrdersDataBloc({required this.homeRepository})
      : super(GetOrdersDataInitial()) {
    on<GetOrdersData>((event, emit) async {
      emit(GetOrdersDataLoading());
      var  result= await homeRepository.getOrders();

      if (result.isNotEmpty) {
        emit(GetOrdersDataSuccess(result));
      }
      else {
        emit(GetOrdersDataFailure("Error Not Found Go "));

      }
        });

    on<GetOneOrdersData>((event, emit) async {
      try{
        emit(GetOneOrdersDataLoading());
        var  result= await homeRepository.getOneOrdersInfo(event.id);
        emit(GetOneOrdersDataSuccess(result));


      }catch(e)
      {
        emit(GetOneOrdersDataFailure(e.toString()));
      }

    });

  }
}