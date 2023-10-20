import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/features/home/domain/models/AcceptedOrders.dart';
import 'package:thalj/features/home/domain/repository.dart';

part 'accepted_offers_event.dart';

part 'accepted_offers_state.dart';

class AcceptedOffersBloc extends Bloc<AcceptedOffersEvent, GetAcceptedOrdersState> {
  OffersRepository offersRepository;
  AcceptedOffersBloc(this.offersRepository)
      : super( GetOrdersDataInitial()) {
    on<AcceptedOffersFetched>(_onAcceptedOffersFetched);
  }
  static AcceptedOffersBloc get(context) => BlocProvider.of(context);
  Future<void> _onAcceptedOffersFetched(
      AcceptedOffersFetched event, Emitter<GetAcceptedOrdersState> emit) async {
    if(event is AcceptedOffersFetched){
      emit(GetOrdersDataLoading());
      var result=await offersRepository.getOffer();
      if(result.isNotEmpty){
        emit(GetOrdersDataSuccess(result));

      }else{
        emit(GetOrdersDataFailure('error'));
      }
    }

  }
}
