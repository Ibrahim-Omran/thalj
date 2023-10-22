import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository.dart';
import 'driver_subscription_event.dart';
import 'driver_subscription_state.dart';

class DriverSubscriptionBloc
    extends Bloc<DriverSubscriptionEvent, DriverSubscriptionState> {
  final SubscriptionInvoiceRepository repository;

  DriverSubscriptionBloc({required this.repository})
      : super(DriverSubscriptionInitial()){
        on<FetchDriverSubscriptions>(_onFetchDriverSubscriptions);
        on<AccDriverSubscriptions>(_accDriverSubscriptions);
      }


  Future<void> _onFetchDriverSubscriptions(
      FetchDriverSubscriptions event, Emitter<DriverSubscriptionState> emit) async {
    // ignore: unnecessary_type_check
    if(event is FetchDriverSubscriptions){
      emit(DriverSubscriptionLoading());
      var result = await repository.getSubscriptionsForDrivers();
      if(result.isNotEmpty){
        emit(DriverSubscriptionLoaded(result));

      }else{
        emit(DriverSubscriptionError('error'));
      }
    }

  }



  Future<void> _accDriverSubscriptions(
      AccDriverSubscriptions event, Emitter<DriverSubscriptionState> emit) async {
    // ignore: unnecessary_type_check
    if(event is AccDriverSubscriptions){
      emit(AccSubscriptionLoading());
      bool isAcc= await repository.renewDriverSubscription(event.billID);
      if(isAcc ){
        emit(AccDriverSubscriptionLoaded("Success"));

      }else{
        emit(AccDriverSubscriptionError('error'));
      }
    }

  }
}
