
class OrdersModel {
  final String id;
  final String name;
  final String region;
  final String regionRecipient;





  OrdersModel({
    required this.id,
    required this.name,
    required this.region,
    required this.regionRecipient
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(id: json['id'], name: json['name'], region: json['region'], regionRecipient:json['regionRecipient']

    );
  }





}
