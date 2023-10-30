
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:thalj/core/functions/saveDataManager.dart';
import 'package:thalj/core/utils/toast.dart';

import '../../../core/utils/app_strings.dart';

class DocumentsRemoteDataSource {

  String? token = SaveDataManager.getRegisterToken();

  Future<bool> uploadProofDocuments({
    required XFile proofOfIdentityFront,
    required XFile proofOfIdentityBack,

    required XFile drivingLicense,
    required XFile vehicleLicense,
    required XFile operatingCard,
    required XFile transferDocument,
    required dynamic commercialRegister,
  }) async {

    try {

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
        'commercialRegister',
      ];
      List<XFile> images = [
        proofOfIdentityFront,
        proofOfIdentityBack,

        drivingLicense,
        vehicleLicense,
        operatingCard,
        transferDocument,
        commercialRegister,
      ];

      return uploadImages(
          Uri.parse('${AppStrings.apiLink}proofDocuments'),
          images,
          formNames,
          headers);
    } catch (e) {
      print(e.toString());
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
      request.files.add(multipartFile);
    }
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      showToast(text: "تم ارسال معلوماتك سيتم التحقق منها يمكن بعدها تسجيل الدخول", state: ToastStates.success);
      return true;
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);

      showToast(text:"برجاء المحاولة لاحقا", state: ToastStates.error);
      return false;
    }
  } catch (e) {
    print(e.toString());

    showToast(text:"برجاء المحاولة لاحقا", state: ToastStates.error);
    return false;
  }
}
