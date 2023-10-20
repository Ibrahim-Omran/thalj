import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:thalj/core/functions/saveDataManager.dart';

class DocumentsRemoteDataSource {
  Future<bool> uploadProofDocuments({
    required File proofOfIdentityFront,
    required File proofOfIdentityBack,
    required File residenceCardFront,
    required File residenceCardBack,
    required File drivingLicense,
    required File vehicleLicense,
    required File operatingCard,
    required File transferDocument,
  }) async {
    try {
      String? token = SaveDataManager.getRegisterToken();
      print(token);
      // final request = http.MultipartRequest(
      //   'PATCH',
      //   Uri.parse('http://mircle50-001-site1.atempurl.com/proofDocuments'),
      // );
      Map<String, String> headers = {
        "Content-Type": "multipart/form-data",
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      };
      List<String> formNames = [
        'proofOfIdentityFront',
        'proofOfIdentityBack',
        'residenceCardFront',
        'residenceCardBack',
        'drivingLicense',
        'vehicleLicense',
        'operatingCard',
        'transferDocument',
      ];
      List<File> images = [
        proofOfIdentityFront,
        proofOfIdentityBack,
        residenceCardFront,
        residenceCardBack,
        drivingLicense,
        vehicleLicense,
        operatingCard,
        transferDocument,
      ];

      return uploadImages(
          Uri.parse('http://mircle50-001-site1.atempurl.com/proofDocuments'),
          images,
          formNames,
          headers);
    } catch (e) {
      print("Error in out function $e");
      return false;
    }
  }
}

Future<bool> uploadImages(Uri apiUrl, List<File> images, List<String> formNames,
    Map<String, String> headers) async {
  try {
    var request = http.MultipartRequest('PATCH', apiUrl);
    for (var i = 0; i < images.length; i++) {
      var bytes = await images[i].readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(formNames[i], bytes);
      request.files.add(multipartFile);
    }
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('All images uploaded successfully');
      return true;
    } else {
      print('Failed to upload images');
      return false;
    }
  } catch (e) {
    print('Error in Upl;oad Images Function $e');
    return false;
  }
}
