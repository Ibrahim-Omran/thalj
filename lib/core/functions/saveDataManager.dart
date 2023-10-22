import '../../features/auth/domain/models/admin_model.dart';
import '../../features/auth/domain/models/login_model.dart';
import '../../features/auth/domain/models/register_model.dart';

class SaveDataManager {
  static LoginModel? loginModel;
  static RegisterModel? registerModel;
  static AdminModel? adminModel;

  static void saveLoginToken(LoginModel model) {
    loginModel = model;
  }


  static String? getLoginToken() {
    return loginModel?.token;
  }

  static String? userStatues() {
    return loginModel?.status;
  }
  static String? getVerifiedDriver() {
    return loginModel?.verified;
  }
  static String? getLoginName() {
    return loginModel?.fullName;
  }

  static void saveRegisterToken(RegisterModel model) {
    registerModel = model;
  }

  static String? getRegisterToken() {
    return registerModel?.token;
  }


  static void saveAdminToken(AdminModel model) {
    adminModel = model;
  }

  static String? getAdminToken() {
    return adminModel?.token;
  }
}
