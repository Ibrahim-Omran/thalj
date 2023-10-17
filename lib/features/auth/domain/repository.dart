import 'package:thalj/features/auth/data/remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepository(
    this.authRemoteDataSource,
  );

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    bool isAuthenticated = false;

    isAuthenticated =
        await authRemoteDataSource.login(email: email, password: password);
    return isAuthenticated;
  }

  Future<bool> register(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    bool isRegister = false;

    isRegister = await authRemoteDataSource.register(
        email: email, password: password, name: name, phone: phone);
    return isRegister;
  }

  Future<bool> ownerLogin(
      {required String email, required String password}) async {
    bool isAuthenticated = false;
    isAuthenticated =
        await authRemoteDataSource.adminLogin(email: email, password: password);
    return isAuthenticated;
  }
}
