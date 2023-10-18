import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:thalj/core/functions/saveTokens.dart';

class DocumentsRemoteDataSource {


  Future<bool> uploadProofDocuments({
    required String proofOfIdentityFront,
    required String proofOfIdentityBack,
    required String residenceCardFront,
    required String residenceCardBack,
    required String drivingLicense,
    required String vehicleLicense,
    required String operatingCard,
    required String transferDocument,
  }) async {
    try {
      String? token = TokenManager.getRegisterToken();
      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/proofDocuments'),
        headers: {
          "Content-Type": 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: {
          'proofOfIdentityFront': proofOfIdentityFront,
          'proofOfIdentityBack': proofOfIdentityBack,
          'residenceCardFront': residenceCardFront,
          'residenceCardBack': residenceCardBack,
          'drivingLicense': drivingLicense,
          'vehicleLicense': vehicleLicense,
          'operatingCard': operatingCard,
          'transferDocument': transferDocument
        },
      );

      if (response.statusCode == 200) {
        print('Proof documents uploaded successfully');
        return true;
      } else {
        print(response.body);
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        print(jsonResponse['message']);
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
