import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/home/data/remote_data_source.dart';
import 'package:thalj/features/home/domain/models/drivers_model.dart';

part 'get_drivers_data_event.dart';
part 'get_drivers_data_state.dart';

class GetDriversDataBloc
    extends Bloc<GetDriversDataEvent, GetDriversDataState> {
  final SendOfferRemoteDataSource sendOfferRemoteDataSource;
  GetDriversDataBloc(this.sendOfferRemoteDataSource)
      : super(GetDriversDataInitial()) {
    on<GetDriversDataEvent>((event, emit) async {
      if (event is GetDriversData) {
        emit(GetDriversDataLoading());
        var result = await sendOfferRemoteDataSource.getDriversData();

        if (result.isNotEmpty) {
          emit(GetDriversDataSuccess(result));
        } else {
          emit(GetDriversDataFailure("Error"));
        }
      }
    });
  }
}
