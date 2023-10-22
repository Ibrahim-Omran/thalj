import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:thalj/core/functions/saveDataManager.dart';

class DocumentsRemoteDataSource {
  Future<bool> uploadProofDocuments({
    required XFile proofOfIdentityFront,
    required XFile proofOfIdentityBack,
    required XFile residenceCardFront,
    required XFile residenceCardBack,
    required XFile drivingLicense,
    required XFile vehicleLicense,
    required XFile operatingCard,
    required XFile transferDocument,
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
        // 'Authorization':
        // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOlt7ImlkIjoiU3VreXAxcnRhTiJ9XSwiaWF0IjoxNjk3OTE1MTg5LCJleHAiOjE3MDA1MDcxODl9.H8T6k_UTrCLmF3KeuONOGYrIn3NjX9jirtscM8-EETs',
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
      List<XFile> images = [
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

Future<bool> uploadImages(Uri apiUrl, List<XFile> images,
    List<String> formNames, Map<String, String> headers) async {
  try {
    var request = http.MultipartRequest('PATCH', apiUrl);
    for (var i = 0; i < images.length; i++) {
      var multipartFile = await http.MultipartFile.fromPath(
        formNames[i],
        images[i].path,
      );
      print('Name ${formNames[i]} : Path ${images[i].path}');
      request.files.add(multipartFile);
    }
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('All images uploaded successfully');
      return true;
    } else {
      print(
          'Failed to upload images rescode: ${response.reasonPhrase}  ${response.statusCode}');
      return false;
    }
  } catch (e) {
    print('Error in Upload Images Function ${e}');
    return false;
  }
}
