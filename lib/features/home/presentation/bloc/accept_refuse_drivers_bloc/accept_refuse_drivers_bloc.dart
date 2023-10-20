import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository.dart';

part 'accept_refuse_drivers_event.dart';
part 'accept_refuse_drivers_state.dart';

class AcceptRefuseDriversBloc
    extends Bloc<AcceptRefuseDriversEvent, AcceptRefuseDriversState> {
  final DriverRepository driverRepository;
  AcceptRefuseDriversBloc({required this.driverRepository})
      : super(AcceptDriversInitial()) {
    on<AcceptRefuseDriversEvent>((event, emit) async {
      if (event is AcceptDrivers) {
        emit(AcceptRefuseDriversLoading());
        var result = await driverRepository.acceptance(event.driverId);

        if (result) {
          emit(AcceptDriversSuccess('Driver is Accepted Successfully'));
        } else {
          emit(AcceptDriversFailure('Driver isn\'t accepted'));
        }
      } else if (event is RefuseDrivers) {
        emit(AcceptRefuseDriversLoading());
        var result = await driverRepository.refuse(event.driverId);

        if (result) {
          emit(RefuseDriversSuccess('Driver is Refused Successfully'));
        } else {
          emit(RefuseDriversFailure('Driver isn\'t Refused'));
        }
      }
    });
  }
}
