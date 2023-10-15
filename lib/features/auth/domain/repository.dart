class AuthRepository {
  Future<void> login() async {

    print('Loading');

    Future.delayed(Duration(seconds: 10));
    print("done");

    throw Exception("faild login");


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