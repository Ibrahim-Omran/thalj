import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:thalj/features/auth/data/remote_data_source.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/utils/toast.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepository(
    this.authRemoteDataSource,
  );
  Future <bool> result =  InternetConnectionChecker().hasConnection;

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isAuthenticated =
        await authRemoteDataSource.login(email: email, password: password);
    return isAuthenticated;
  }

  Future<bool> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }

    bool isRegister  = await authRemoteDataSource.register(
        email: email, password: password, name: name, phone: phone);
    return isRegister;
  }

  Future<bool> ownerLogin(
      {required String email, required String password}) async {
    if(await result ==false)
    {
      showToast(text: AppStrings.noInternet, state: ToastStates.error);
    }
    bool isAuthenticated = false;
    isAuthenticated =
        await authRemoteDataSource.adminLogin(email: email, password: password);
    return isAuthenticated;
  }
}
