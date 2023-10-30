import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/features/documents/data/remote_data.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';

class DocumentRepository {
  final DocumentsRemoteDataSource documentDataSource;
  DocumentRepository(this.documentDataSource);
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<bool> uploadDocuments({
    required XFile proofOfIdentityFront,
    required XFile proofOfIdentityBack,

    required XFile drivingLicense,
    required XFile vehicleLicense,
    required XFile operatingCard,
    required XFile transferDocument,
    required dynamic commercialRegister,
  }) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    var isUploaded = await documentDataSource.uploadProofDocuments(
      proofOfIdentityFront: proofOfIdentityFront,
      proofOfIdentityBack: proofOfIdentityBack,
      commercialRegister: commercialRegister,

      drivingLicense: drivingLicense,
      vehicleLicense: vehicleLicense,
      operatingCard: operatingCard,
      transferDocument: transferDocument,
    );

    return isUploaded;
  }
}