import 'package:http/http.dart' as http;



class LoginRemoteDataSource {


  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://mircle50-001-site1.atempurl.com/drivers/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        // Login successful, handle the response as needed
      } else {
        // Login failed, handle the response or throw an exception
        throw Exception("user Not Found");
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

}