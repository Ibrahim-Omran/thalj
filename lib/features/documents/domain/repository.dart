import 'dart:io';

import 'package:thalj/features/documents/data/remote_data.dart';

class DocumentRepository {
  final DocumentsRemoteDataSource documentDataSource;
  DocumentRepository(this.documentDataSource);

  Future<bool> uploadDocuments({
    required File proofOfIdentityFront,
    required File proofOfIdentityBack,
    required File residenceCardFront,
    required File residenceCardBack,
    required File drivingLicense,
    required File vehicleLicense,
    required File operatingCard,
    required File transferDocument,
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
