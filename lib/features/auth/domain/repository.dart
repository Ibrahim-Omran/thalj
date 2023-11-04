import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/features/auth/data/remote_data_source.dart';
import 'package:thalj/features/auth/domain/models/login_model.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';
import 'models/admin_model.dart';
import 'models/register_model.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository(
    this.authRemoteDataSource,
  );

  Future<bool> result = InternetConnectionChecker().hasConnection;

  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    if (await result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return null;
    }

    final LoginModel? loginModel =
        await authRemoteDataSource.login(email: email, password: password);
    return loginModel;
  }

  Future<RegisterModel?> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    if (await result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return null;
    }

    final RegisterModel? registerModel = await authRemoteDataSource.register(
      email: email,
      password: password,
      name: name,
      phone: phone,
    );
    return registerModel;
  }

  Future<AdminModel?> ownerLogin({
    required String email,
    required String password,
  }) async {
    if (await result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return null;
    }

    final AdminModel? adminModel =
        await authRemoteDataSource.adminLogin(email: email, password: password);
    return adminModel;
  }

  Future<bool> sendOTPToEmail(String email) async {
    if (result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return Future.value(false);
    }
    return await authRemoteDataSource.sendOTPToEmail(email);
  }

  Future<bool> sendOTPWithEmail(String email, String otp) async {
    if (result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return Future.value(false);
    }
    return await authRemoteDataSource.sendOTPWithEmail(email, otp);
  }

  Future<bool> sendOTPToEmailReset(String email) async {
    if (result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return Future.value(false);
    }
    return await authRemoteDataSource.sendOTPToEmailReset(email);
  }

  Future<bool> sendOTPResetPass(String email, String otp, String pass) async {
    if (result == false) {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
      return Future.value(false);
    }
    return await authRemoteDataSource.sendOTPResetPass(email, otp, pass);
  }
}
