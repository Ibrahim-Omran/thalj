import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/home/data/remote_data_source.dart';

part 'accept_drivers_event.dart';
part 'accept_drivers_state.dart';

class AcceptDriversBloc extends Bloc<AcceptDriversEvent, AcceptDriversState> {
  final SendOfferRemoteDataSource sendOfferRemoteDataSource;
  AcceptDriversBloc(this.sendOfferRemoteDataSource)
      : super(AcceptDriversInitial()) {
    on<AcceptDriversEvent>((event, emit) async {
      if (event is AcceptDrivers) {
        emit(AcceptDriversLoading());
        var result =
            await sendOfferRemoteDataSource.acceptDrivers(event.driverId);

        if (result) {
          emit(AcceptDriversSuccess('Driver is Accepted Successfully'));
        } else {
          emit(AcceptDriversFailure('Driver isn\'t accepted'));
        }
      }
    });
  }
}
