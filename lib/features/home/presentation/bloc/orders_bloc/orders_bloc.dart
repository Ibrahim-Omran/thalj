import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/remote_data_source.dart';
import '../../../domain/repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';
import '../../../domain/repository.dart'; // adjust the path based on your project structure
import 'orders_state.dart';


class GetOrdersDataBloc extends Bloc<GetOrdersDataEvent, GetOrdersDataState> {
  final OrdersRepository orderRepository;


  GetOrdersDataBloc({required this.orderRepository})
      : super(GetOrdersDataInitial()) {
    on<GetOrdersDataEvent>((event, emit) async {
      if (event is GetOrdersData) {
        emit(GetOrdersDataLoading());
        var  result= await orderRepository.getOrders();


        if (result.isNotEmpty) {
          emit(GetOrdersDataSuccess(result));
        } else {
          emit(GetOrdersDataFailure("Error"));
        }
      }
    });
  }
}