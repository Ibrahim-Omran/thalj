import 'dart:convert';

class DriversModel {
  String? id;
  String? fullname;
  int? phone;
  String? email;
  String? proofOfIdentityFront;
  String? proofOfIdentityBack;
  String? residenceCardFront;
  String? residenceCardBack;
  String? drivingLicense;
  String? vehicleLicense;
  String? operatingCard;
  String? transferDocument;
  String? verified;
  int? subscription;
  String? subscriptionDate;

  DriversModel({
    this.id,
    this.fullname,
    this.phone,
    this.email,
    this.proofOfIdentityFront,
    this.proofOfIdentityBack,
    this.residenceCardFront,
    this.residenceCardBack,
    this.drivingLicense,
    this.vehicleLicense,
    this.operatingCard,
    this.transferDocument,
    this.verified,
    this.subscription,
    this.subscriptionDate,
  });

  factory DriversModel.fromMap(Map<String, dynamic> data) => DriversModel(
        id: data['id'] as String?,
        fullname: data['fullname'] as String?,
        phone: data['phone'] as int?,
        email: data['email'] as String?,
        proofOfIdentityFront: data['proofOfIdentityFront'] as String?,
        proofOfIdentityBack: data['proofOfIdentityBack'] as String?,
        residenceCardFront: data['residenceCardFront'] as String?,
        residenceCardBack: data['residenceCardBack'] as String?,
        drivingLicense: data['drivingLicense'] as String?,
        vehicleLicense: data['vehicleLicense'] as String?,
        operatingCard: data['operatingCard'] as String?,
        transferDocument: data['transferDocument'] as String?,
        verified: data['verified'] as String?,
        subscription: data['subscription'] as int?,
        subscriptionDate: data['subscription_date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullname': fullname,
        'phone': phone,
        'email': email,
        'proofOfIdentityFront': proofOfIdentityFront,
        'proofOfIdentityBack': proofOfIdentityBack,
        'residenceCardFront': residenceCardFront,
        'residenceCardBack': residenceCardBack,
        'drivingLicense': drivingLicense,
        'vehicleLicense': vehicleLicense,
        'operatingCard': operatingCard,
        'transferDocument': transferDocument,
        'verified': verified,
        'subscription': subscription,
        'subscription_date': subscriptionDate,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DriversModel].
  factory DriversModel.fromJson(String data) {
    return DriversModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DriversModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
