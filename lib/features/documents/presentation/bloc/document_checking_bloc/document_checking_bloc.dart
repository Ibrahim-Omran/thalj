import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/features/documents/domain/repository.dart';

part 'document_checking_event.dart';

part 'document_checking_state.dart';

class DocumentCheckingBloc
    extends Bloc<DocumentCheckingEvent, DocumentCheckingState> {
  final DocumentRepository documentRepository;

  DocumentCheckingBloc({required this.documentRepository}) : super(DocumentCheckingInitial()) {
    on<DocumentCheckingEvent>((event, emit) async {

      if (event is DocumentUpload) {
        emit(DocumentUploading());
        var isUploaded = await documentRepository.uploadDocuments(
          proofOfIdentityFront: event.proofOfIdentityFront,
          proofOfIdentityBack: event.proofOfIdentityBack,
          residenceCardFront: event.residenceCardFront,
          residenceCardBack: event.residenceCardBack,
          drivingLicense: event.drivingLicense,
          vehicleLicense: event.vehicleLicense,
          operatingCard: event.operatingCard,
          transferDocument: event.transferDocument,
        );
        if (isUploaded) {
          emit(DocumentCheckingLoading(true, AppStrings.pleaseWait,
              AppStrings.ourTeamChecking, AppAssets.loadingChecking));
        } else {
          emit(DocumentUploadFailed());
        }
      } else if (event is DocumentChecking) {
        emit(DocumentCheckingLoading(true, AppStrings.pleaseWait,
            AppStrings.ourTeamChecking, AppAssets.loadingChecking));
      } else {
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
