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
    on<EditNameSubmitted>(_onEditNameSubmitted);
    on<EditEmailSubmitted>(_onEditEmailSubmitted);
    on<EditPhoneSubmitted>(_onEditPhoneSubmitted);
    on<EditPasswordSubmitted>(_onEditPasswordSubmitted);
    on<EditToggleObscureText>(_onToggleObscureText);
    on<EditToggleConfirmedObscureText>(_onToggleConfirmedObscureText);

  }
  Future<void> _onEditNameSubmitted(
      EditNameSubmitted event, Emitter<EditInfoState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isEditInfo = await homeRepository.editName(
        name: event.name,

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

  Future<void> _onEditEmailSubmitted(
      EditEmailSubmitted event, Emitter<EditInfoState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isEditInfo = await homeRepository.editEmail(
        email: event.email,

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
  Future<void> _onEditPhoneSubmitted(
      EditPhoneSubmitted event, Emitter<EditInfoState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isEditInfo = await homeRepository.editPhone(
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
  Future<void> _onEditPasswordSubmitted(
      EditPasswordSubmitted event, Emitter<EditInfoState> emit) async {
    emit(state.copyWith(isSubmitting: true));
    try {
      final bool isEditInfo = await homeRepository.editPass(
        password: event.password,

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

  void _onToggleObscureText(
      EditToggleObscureText event, Emitter<EditInfoState> emit) {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void _onToggleConfirmedObscureText(
      EditToggleConfirmedObscureText event, Emitter<EditInfoState> emit) {
    emit(state.copyWith(obscureText: !state.confirmedObscureText));
  }
}
