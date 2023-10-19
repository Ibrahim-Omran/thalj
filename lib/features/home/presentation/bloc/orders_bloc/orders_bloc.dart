import 'package:bloc/bloc.dart';

import '../../../domain/repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';



class GetOrdersDataBloc extends Bloc<GetOrdersDataEvent, GetOrdersDataState> {
  final DriverRepository driverRepository;


  GetOrdersDataBloc({required this.driverRepository})
      : super(GetOrdersDataInitial()) {
    on<GetOrdersDataEvent>((event, emit) async {
      if (event is GetOrdersData) {
        emit(GetOrdersDataLoading());
        var  result= await driverRepository.getOrders();
        if (result.isNotEmpty) {
          emit(GetOrdersDataSuccess(result));
        } else {
          emit(GetOrdersDataFailure("Error"));
        }
      }
    });
  }
}