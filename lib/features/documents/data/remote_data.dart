
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/core/functions/saveDataManager.dart';
import 'package:thalj/core/utils/toast.dart';

import '../../../core/utils/app_strings.dart';

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
    bool result = await InternetConnectionChecker().hasConnection;
    if(!result)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    try {
      String? token = SaveDataManager.getRegisterToken();

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
      return false;
    }
  }
}

Future<bool> uploadImages(Uri apiUrl, List<XFile> images,
    List<String> formNames, Map<String, String> headers) async {
  bool result = await InternetConnectionChecker().hasConnection;
  if(!result)
  {
    showToast(text: AppStrings.noInternet, state: ToastStates.error);
  }
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

      showToast(text:"برجاء المحاولة لاحقا", state: ToastStates.error);
      return false;
    }
  } catch (e) {
    showToast(text:"برجاء المحاولة لاحقا", state: ToastStates.error);
    return false;
  }
}
