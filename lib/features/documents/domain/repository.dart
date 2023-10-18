import 'package:thalj/features/documents/data/remote_data.dart';

class DocumentRepository {
  final DocumentsRemoteDataSource documentDataSource;
  DocumentRepository(this.documentDataSource);

  Future<bool> uploadDocuments({
    required String proofOfIdentityFront,
    required String proofOfIdentityBack,
    required String residenceCardFront,
    required String residenceCardBack,
    required String drivingLicense,
    required String vehicleLicense,
    required String operatingCard,
    required String transferDocument,
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
