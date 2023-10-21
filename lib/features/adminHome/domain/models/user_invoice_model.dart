class UserInvoiceModel {
  final String userId;
  final String userName;
  final String file;
  final String orderId;
  final String id;
  final int refused;
  final String driverId;
  final String image;

  UserInvoiceModel(
      {required this.userId,
      required this.userName,
      required this.file,
      required this.orderId,
      required this.id,
      required this.refused,
      required this.driverId,
      required this.image});

  factory UserInvoiceModel.fromJson(jsonData) {
    return UserInvoiceModel(
        userId: jsonData['userId'],
        userName: jsonData['userName'],
        file: jsonData['file'],
        orderId: jsonData['orderId'],
        id: jsonData['id'],
        refused: jsonData['refused'],
        driverId: jsonData['driverId'],
        image: jsonData['image']);
  }
}
