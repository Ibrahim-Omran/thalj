
class OneOrderModel {
  final SenderInfo senderInfo;
  final RecipientInfo recipientInfo;
  final FreightInfo freightInfo;

  OneOrderModel({
    required this.senderInfo,
    required this.recipientInfo,
    required this.freightInfo,
  });

  factory OneOrderModel.fromJson(Map<String, dynamic> json) {
    return OneOrderModel(
      senderInfo: SenderInfo.fromJson(json['senderInfo']),
      recipientInfo: RecipientInfo.fromJson(json['recipientInfo']),
      freightInfo: FreightInfo.fromJson(json['freightInfo']),
    );
  }
}

class SenderInfo {
  final String region;
  final String location;
  final int buildingNumber;
  final String floorNumber;
  final int apartmentNumber;
  final String specialSign;
  final int phoneNumber;

  SenderInfo({
    required this.region,
    required this.location,
    required this.buildingNumber,
    required this.floorNumber,
    required this.apartmentNumber,
    required this.specialSign,
    required this.phoneNumber,
  });

  factory SenderInfo.fromJson(Map<String, dynamic> json) {
    return SenderInfo(
      region: json['region'],
      location: json['location'],
      buildingNumber: json['buildingNumber'],
      floorNumber: json['floorNumber'],
      apartmentNumber: json['apartmentNumber'],
      specialSign: json['specialSign'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

class RecipientInfo {
  final String region;
  final String location;
  final int buildingNumber;
  final String floorNumber;
  final int apartmentNumber;
  final String specialSign;
  final int phoneNumber;

  RecipientInfo({
    required this.region,
    required this.location,
    required this.buildingNumber,
    required this.floorNumber,
    required this.apartmentNumber,
    required this.specialSign,
    required this.phoneNumber,
  });

  factory RecipientInfo.fromJson(Map<String, dynamic> json) {
    return RecipientInfo(
      region: json['region'],
      location: json['location'],
      buildingNumber: json['buildingNumber'],
      floorNumber: json['floorNumber'],
      apartmentNumber: json['apartmentNumber'],
      specialSign: json['specialSign'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

class FreightInfo {
  final String description;
  final String name;
  final int weight;
  final String humidity;
  final int temperature;
  final String locationFreight;

  FreightInfo({
    required this.description,
    required this.name,
    required this.weight,
    required this.humidity,
    required this.temperature,
    required this.locationFreight,
  });

  factory FreightInfo.fromJson(Map<String, dynamic> json) {
    return FreightInfo(
      description: json['description'],
      name: json['name'],
      weight: json['weight'],
      humidity: json['humidity'],
      temperature: json['temperature'],
      locationFreight: json['locationFreight'],
    );
  }
}