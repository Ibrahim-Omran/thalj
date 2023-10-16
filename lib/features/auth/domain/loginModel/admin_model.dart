class AdminModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final String token;

  AdminModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.token});

  factory AdminModel.fromJson(jsonData, token) {
    return AdminModel(
        id: jsonData['id'],
        name: jsonData['name'],
        phone: jsonData['phone'],
        email: jsonData['email'],
        image: jsonData['image'],
        token: token);
  }
}
