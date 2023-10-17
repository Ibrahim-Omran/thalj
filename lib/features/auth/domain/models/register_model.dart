class RegisterModel {
  final RegisterModelData data;
  final String token;

  RegisterModel({
    required this.data,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: RegisterModelData.fromJson(json['data']),
      token: json['token'],
    );
  }
}

class RegisterModelData {
  final String id;
  final String fullname;
  final String phone;
  final String email;

  RegisterModelData({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
  });

  factory RegisterModelData.fromJson(Map<String, dynamic> json) {
    return RegisterModelData(
      id: json['id'],
      fullname: json['fullname'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
