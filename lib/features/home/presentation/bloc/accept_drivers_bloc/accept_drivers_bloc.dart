import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository.dart';

part 'accept_drivers_event.dart';
part 'accept_drivers_state.dart';

class AcceptDriversBloc extends Bloc<AcceptDriversEvent, AcceptDriversState> {
  final DriverRepository driverRepository;
  AcceptDriversBloc({required this.driverRepository})
      : super(AcceptDriversInitial()) {
    on<AcceptDriversEvent>((event, emit) async {
      if (event is AcceptDrivers) {
        emit(AcceptDriversLoading());
        var result =
            await driverRepository.acceptance(event.driverId);

        if (result) {
          emit(AcceptDriversSuccess('Driver is Accepted Successfully'));
        } else {
          emit(AcceptDriversFailure('Driver isn\'t accepted'));
        }
      }
    });
  }
}
