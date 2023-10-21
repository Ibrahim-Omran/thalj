class DriverSubscriptionModel {
  final String id;
  final String driverId;
  final String invoice;

  DriverSubscriptionModel({
    required this.id,
    required this.driverId,
    required this.invoice,
  });

  factory DriverSubscriptionModel.fromJson(Map<String, dynamic> json) {
    return DriverSubscriptionModel(
      id: json['id'],
      driverId: json['driverId'],
      invoice: json['invoice'],
    );
  }
}