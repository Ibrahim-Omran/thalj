import 'package:image_picker/image_picker.dart';
import 'package:thalj/features/documents/data/remote_data.dart';

class DocumentRepository {
  final DocumentsRemoteDataSource documentDataSource;
  DocumentRepository(this.documentDataSource);

  Future<bool> uploadDocuments({
    required XFile proofOfIdentityFront,
    required XFile proofOfIdentityBack,
    required XFile residenceCardFront,
    required XFile residenceCardBack,
    required XFile drivingLicense,
    required XFile vehicleLicense,
    required XFile operatingCard,
    required XFile transferDocument,
  }) async {
    var isUploaded = await documentDataSource.uploadProofDocuments(
      proofOfIdentityFront: proofOfIdentityFront,
      proofOfIdentityBack: proofOfIdentityBack,
      residenceCardFront: residenceCardFront,
      residenceCardBack: residenceCardBack,
      drivingLicense: drivingLicense,
      vehicleLicense: vehicleLicense,
      operatingCard: operatingCard,
      transferDocument: transferDocument,
    );
    return isUploaded;
  }
}