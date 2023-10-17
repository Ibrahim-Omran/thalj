import '../../features/auth/domain/models/login_model.dart';
import '../../features/auth/domain/models/register_model.dart';

class TokenManager {
  static LoginModel? loginModel;
  static RegisterModel? registerModel;

  static void saveLoginToken(LoginModel model) {
    loginModel = model;
  }

  static String? getLoginToken() {
    return loginModel?.token;
  }

  static void saveRegisterToken(RegisterModel model) {
    registerModel = model;
  }

  static String? getRegisterToken() {
    return registerModel?.token;
  }
}
