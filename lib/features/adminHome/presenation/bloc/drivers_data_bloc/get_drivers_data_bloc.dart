import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/adminHome/domain/models/drivers_model.dart';

import '../../../domain/repository.dart';

part 'get_drivers_data_event.dart';
part 'get_drivers_data_state.dart';

class GetDriversDataBloc
    extends Bloc<GetDriversDataEvent, GetDriversDataState> {
  final AdminRepository adminRepository;
  GetDriversDataBloc({required this.adminRepository})
      : super(GetDriversDataInitial()) {
    on<GetDriversDataEvent>((event, emit) async {
      if (event is GetDriversData) {
        emit(GetDriversDataLoading());
        var result = await adminRepository.getDrivers();

        if (result.isNotEmpty) {
          emit(GetDriversDataSuccess(result));
        } else {
          emit(GetDriversDataFailure("Error"));
        }
      }
    });
  }
}