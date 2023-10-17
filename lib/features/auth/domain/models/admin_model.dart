class AdminModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final int verified;
  final String token;

  AdminModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.verified,
      required this.image,
      required this.token});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      verified: json['verified'],
      token: json['token'],
    );
  }
}
