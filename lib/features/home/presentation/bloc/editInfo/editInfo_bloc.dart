import 'package:bloc/bloc.dart';
import 'package:thalj/features/home/presentation/bloc/editInfo/editInfo_event.dart';
import 'package:thalj/features/home/presentation/bloc/editInfo/editInfo_state.dart';


import '../../../domain/repository.dart';

class EditInfoBloc extends Bloc<EditInfoEvent, EditInfoState> {
  final HomeRepository homeRepository;

  EditInfoBloc({required this.homeRepository})
      : super(EditInfoState(
          name: '',
          email: '',
          phone: '',
        )) {
    on<EditInfoSubmitted>(_onEditInfoSubmitted);
  }
  Future<void> _onEditInfoSubmitted(
      EditInfoSubmitted event, Emitter<EditInfoState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isEditInfo = await homeRepository.editInfo(
        name: event.name,
        email: event.email,
        phone: event.phone,
      );

      if (isEditInfo) {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          error: 'edit Info faild',
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
