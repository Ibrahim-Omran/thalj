import 'package:bloc/bloc.dart';
import 'package:thalj/features/home/presentation/bloc/send_event.dart';
import 'package:thalj/features/home/presentation/bloc/send_state.dart';

import '../../domain/repository.dart';

class SendOfferBloc extends Bloc<SendOfferEvent, SendOfferState> {
  final DriverRepository driverRepository;

  SendOfferBloc({required this.driverRepository})
      : super(SendOfferState(
          name: '',
          phone: '',
          price: '',
        )) {
    on<SendOfferSubmitted>(_onSendOfferSubmitted);
  }
  Future<void> _onSendOfferSubmitted(
      SendOfferSubmitted event, Emitter<SendOfferState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isSendOffer = await driverRepository.sendOffer(
        name: event.name,
        price: event.price,
        phone: event.phone,
      );
      print(isSendOffer);

      if (isSendOffer) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          error: 'Send Offer Faild',
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
