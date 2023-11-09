import 'package:bloc/bloc.dart';



import '../../../domain/repository.dart';
import 'delivered_bloc_event.dart';
import 'delivered_bloc_state.dart';

class DeliveredBloc extends Bloc<DeliveredOfferEvent, DeliveredOfferState> {
  final HomeRepository homeRepository;

  DeliveredBloc({required this.homeRepository})
      : super(DeliveredOfferState()) {
    on<DeliveredOfferSubmitted>(_onDeliveredSubmitted);
  }
  Future<void> _onDeliveredSubmitted(
      DeliveredOfferSubmitted event, Emitter<DeliveredOfferState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isDelivered = await homeRepository.deliveredOffer(

        id:event.id,
      );

      if (isDelivered) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          error: 'Delivered Offer Faild',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isSubmitting: false,
        isSuccess: false,
        error: e.toString(),
      ));
    }
  }
}