import 'package:thalj/features/auth/data/login_remote_data_source.dart';

class AuthRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  AuthRepository(this.loginRemoteDataSource);


  Future<bool> login({required String email, password,}) async {
    bool isAuthenticated = false;

    isAuthenticated = await loginRemoteDataSource.login(email: email,password: password);
    return isAuthenticated;

  }

  Future<void> register() async {

    print('Loading');

    Future.delayed(Duration(seconds: 10));
    print("done");
    throw Exception("register faild register");

  }


  Future<void> ownerLogin() async {

    print('Loading');

    Future.delayed(Duration(seconds: 10));
    print("done");
    throw Exception("register faild ownerLogin");

  }
}