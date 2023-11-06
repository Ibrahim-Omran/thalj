import 'package:image_picker/image_picker.dart';
import 'package:thalj/features/documents/data/remote_data.dart';

import '../../../core/errors/internetCheck.dart';


class DocumentRepository {
  final DocumentsRemoteDataSource documentDataSource;
  DocumentRepository(this.documentDataSource);

  Future<bool> uploadDocuments({
    required XFile proofOfIdentityFront,
    required XFile proofOfIdentityBack,
    required XFile drivingLicense,
    required XFile vehicleLicense,
    required XFile operatingCard,
    required XFile transferDocument,
    required XFile? commercialRegister,
  }) async {
    await NetworkInfoImpl().checkInternet();

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