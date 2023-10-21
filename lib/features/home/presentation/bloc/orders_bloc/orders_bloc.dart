import 'package:bloc/bloc.dart';

import '../../../domain/repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';



class GetOrdersDataBloc extends Bloc<GetOrdersDataEvent, GetOrdersDataState> {
  final DriverRepository driverRepository;


  GetOrdersDataBloc({required this.driverRepository})
      : super(GetOrdersDataInitial()) {
    on<GetOrdersData>((event, emit) async {
      emit(GetOrdersDataLoading());
      var  result= await driverRepository.getOrders();
      if (result.isNotEmpty) {
        emit(GetOrdersDataSuccess(result));
      } else {
        emit(GetOrdersDataFailure("Error"));
      }
        });

    on<GetOneOrdersData>((event, emit) async {
      try{
        emit(GetOneOrdersDataLoading());
        var  result= await driverRepository.getOneOrdersInfo(event.id);
        emit(GetOneOrdersDataSuccess(result));


      }catch(e)
      {
        emit(GetOneOrdersDataFailure(e.toString()));
      }

    });

  }
}