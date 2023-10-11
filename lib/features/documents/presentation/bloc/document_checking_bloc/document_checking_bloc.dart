import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';

part 'document_checking_event.dart';
part 'document_checking_state.dart';

class DocumentCheckingBloc
    extends Bloc<DocumentCheckingEvent, DocumentCheckingState> {
  DocumentCheckingBloc() : super(DocumentCheckingInitial()) {
    on<DocumentCheckingEvent>((event, emit) async {
      if (event is DocumentChecking) {
        emit(DocumentCheckingLoading(true, AppStrings.pleaseWait,
            AppStrings.ourTeamChecking, AppAssets.loadingChecking));

        await Future.delayed(Duration(seconds: 5));
        emit(DocumentCheckingSuccess(false, AppStrings.congratulation,
            AppStrings.doneChecking, AppAssets.doneChecking));
      }
    });
  }
  @override
  void onChange(Change<DocumentCheckingState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(
      Transition<DocumentCheckingEvent, DocumentCheckingState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}
