import 'package:thalj/core/errors/internetCheck.dart';
import 'package:thalj/features/auth/data/remote_data_source.dart';
import 'package:thalj/features/auth/domain/models/login_model.dart';

import 'models/admin_model.dart';
import 'models/register_model.dart';

class AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepository(
    this.authRemoteDataSource,
  );


  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    await NetworkInfoImpl().checkInternet();


    final LoginModel? loginModel =
    await authRemoteDataSource.login(email: email, password: password);
    return loginModel;
  }

  Future<RegisterModel?> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String bankName,
    required String interAccNum,
    required String accNum,
  }) async {
    await NetworkInfoImpl().checkInternet();

    final RegisterModel? registerModel = await authRemoteDataSource.register(
        email: email,
        password: password,
        name: name,
        phone: phone,
        bankName: bankName,
        interAccNum: interAccNum,
        accNum: accNum);
    return registerModel;

  }

  Future<AdminModel?> ownerLogin({
    required String email,
    required String password,
  }) async {
    await NetworkInfoImpl().checkInternet();

    final AdminModel? adminModel =
    await authRemoteDataSource.adminLogin(email: email, password: password);
    return adminModel;
  }

  Future<bool?> sendOTPToEmail(String email) async {
    await NetworkInfoImpl().checkInternet();


    var isSended = authRemoteDataSource.sendOTPToEmail(email);

    return await isSended;
  }

  Future<bool> sendOTPWithEmail(String email, String otp) async {
    await NetworkInfoImpl().checkInternet();


    return await authRemoteDataSource.sendOTPWithEmail(email, otp);
  }

  Future<bool?> sendOTPToEmailReset(String email) async {
    await NetworkInfoImpl().checkInternet();

    var sened= authRemoteDataSource.sendOTPToEmailReset(email);
    return sened ;

  }

  Future<bool?> sendOTPResetPass(String email, String otp, String pass) async {
    await NetworkInfoImpl().checkInternet();

    return await authRemoteDataSource.sendOTPResetPass(email, otp, pass);

  }
}
