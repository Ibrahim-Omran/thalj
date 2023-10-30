class LoginModel {
  final String id;
  final String fullName;
  final int phone;
  final String email;

  final String verified;
  final int subscription;
  final String token;
   String? status;

  LoginModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
   required this.token,
    required this.status,
    required this.verified,
    required this.subscription,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      fullName: json['fullname'],
      phone: json['phone'],
      email: json['email'],

      verified: json['verified'],
      subscription: json['subscription'],
      status: json['status'],
      token: json['token'],
    );
  }
}
