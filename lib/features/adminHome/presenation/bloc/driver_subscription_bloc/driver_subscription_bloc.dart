import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repository.dart';
import 'driver_subscription_event.dart';
import 'driver_subscription_state.dart';

class DriverSubscriptionBloc
    extends Bloc<DriverSubscriptionEvent, DriverSubscriptionState> {
  final AdminRepository adminRepository;

  DriverSubscriptionBloc({required this.adminRepository})
      : super(DriverSubscriptionInitial()){
        on<FetchDriverSubscriptions>(_onFetchDriverSubscriptions);
        on<AccDriverSubscriptions>(_accDriverSubscriptions);
      }

  static DriverSubscriptionBloc get(context) => BlocProvider.of(context);

  Future<void> _onFetchDriverSubscriptions(
      FetchDriverSubscriptions event, Emitter<DriverSubscriptionState> emit) async {
    // ignore: unnecessary_type_check
    if(event is FetchDriverSubscriptions){
      emit(DriverSubscriptionLoading());
      var result = await adminRepository.getSubscriptionsForDrivers();
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
      bool isAcc= await adminRepository.renewDriverSubscription(event.billID);
      if(isAcc ){
        emit(AccDriverSubscriptionLoaded("Success"));
        var result = await adminRepository.getSubscriptionsForDrivers();

        emit(DriverSubscriptionLoaded(result));
        if(result.isEmpty){
          emit(DriverSubscriptionError('error'));

        }


      }else{
        emit(AccDriverSubscriptionError('error'));
      }
    }

  }
}
