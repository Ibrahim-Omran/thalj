import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';

part 'document_checking_event.dart';
part 'document_checking_state.dart';

class DocumentCheckingBloc
    extends Bloc<DocumentCheckingEvent, DocumentCheckingState> {
  DocumentCheckingBloc() : super(DocumentCheckingInitial()) {
    on<DocumentCheckingEvent>((event, emit) {
      emit(DocumentCheckingLoading(true, AppStrings.pleaseWait,
          AppStrings.ourTeamChecking, AppAssets.loadingChecking));
      Future.delayed(const Duration(seconds: 3));
      emit(DocumentCheckingSuccess(false, AppStrings.congratulation,
          AppStrings.doneChecking, AppAssets.doneChecking));
    });
  }
}
