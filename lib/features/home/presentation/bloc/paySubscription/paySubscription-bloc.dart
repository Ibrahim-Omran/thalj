
import 'package:bloc/bloc.dart';

import 'package:thalj/features/home/domain/repository.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-event.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-state.dart';



class PaySubScriptionBloc
    extends Bloc<PaySubscriptionEvent, PaySubscriptionState> {
  final DriverRepository driverRepository;

  PaySubScriptionBloc({required this.driverRepository})
      : super(PaySubscriptionInitial()) {
    on<PaySubscriptionEvent>((event, emit) async {
      if (event is PaySubscriptionUpload) {
        emit(PaySubscriptionUploading());
        var isUploaded = await driverRepository.paySubscription(billPhoto:event.billPhoto);
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
    print(change);
  }

  @override
  void onTransition(
      Transition<PaySubscriptionEvent, PaySubscriptionState> transition) {
    super.onTransition(transition);
    print(transition);

  }
}
