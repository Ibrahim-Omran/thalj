import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/home/domain/models/drivers_model.dart';

import '../../../domain/repository.dart';

part 'get_drivers_data_event.dart';
part 'get_drivers_data_state.dart';

class GetDriversDataBloc
    extends Bloc<GetDriversDataEvent, GetDriversDataState> {
  final DriverRepository driverRepository;
  GetDriversDataBloc({required this.driverRepository})
      : super(GetDriversDataInitial()) {
    on<GetDriversDataEvent>((event, emit) async {
      if (event is GetDriversData) {
        emit(GetDriversDataLoading());
        var result = await driverRepository.getDrivers();

        if (result.isNotEmpty) {
          emit(GetDriversDataSuccess(result));
        } else {
          emit(GetDriversDataFailure("Error"));
        }
      }
    });
  }
}
