import '../../features/auth/domain/models/login_model.dart';

class TokenManager {
  static LoginModel? loginModel;

  static void saveToken(LoginModel model) {
    loginModel = model;
  }

  static String? getToken() {
    return loginModel?.token;
  }
}