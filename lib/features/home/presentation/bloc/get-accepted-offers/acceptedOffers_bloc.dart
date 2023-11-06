import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/functions/result.dart';

import '../../../domain/repository.dart';

import 'acceptedOffers_event.dart';
import 'acceptedOffers_state.dart';

class AcceptedOrderBloc extends Bloc<AcceptedOffersEvent, AcceptedOrdersState> {
  HomeRepository homeRepository;

  AcceptedOrderBloc({required this.homeRepository})
      : super(GetOrdersDataInitial()) {
    on<AcceptedOffersFetched>(_onAcceptedOffersFetched);
  }

  static AcceptedOrderBloc get(context) => BlocProvider.of(context);

  Future<void> _onAcceptedOffersFetched(AcceptedOffersFetched event,
      Emitter<AcceptedOrdersState> emit) async {
    emit(GetOrdersDataLoading());
    var result = await homeRepository.getOffer();
    result.handle(success: (ordersData) {
      emit(GetOrdersDataSuccess(ordersData));
    },
      failure: (errorMessage) {
        emit(GetOrdersDataFailure(errorMessage));
      },
    );
  }
}