
import 'package:bloc/bloc.dart';

import 'package:thalj/features/home/domain/repository.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-event.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-state.dart';



class PaySubScriptionBloc
    extends Bloc<PaySubscriptionEvent, PaySubscriptionState> {
  final HomeRepository homeRepository;

  PaySubScriptionBloc({required this.homeRepository})
      : super(PaySubscriptionInitial()) {
    on<PaySubscriptionEvent>((event, emit) async {
      if (event is PaySubscriptionUpload) {
        emit(PaySubscriptionUploading());
        var isUploaded = await homeRepository.paySubscription(billPhoto:event.billPhoto);
        if (isUploaded) {
          emit(PaySubscriptionSuccess());
        } else {
          emit(PaySubscriptionUploadFailed());
        }

    }});
  }

  @override
  void onChange(Change<PaySubscriptionState> change) {
    super.onChange(change);
  }

  @override
  void onTransition(
      Transition<PaySubscriptionEvent, PaySubscriptionState> transition) {
    super.onTransition(transition);

  }
}
