class LoginModel {
  final String id;
  final String fullName;
  final int phone;
  final String email;
  final String proofOfIdentityFront;
  final String proofOfIdentityBack;
  final String residenceCardFront;
  final String residenceCardBack;
  final String drivingLicense;
  final String vehicleLicense;
  final String operatingCard;
  final String transferDocument;
  final String verified;
  final String token;

  LoginModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.proofOfIdentityFront,
    required this.proofOfIdentityBack,
    required this.residenceCardFront,
    required this.residenceCardBack,
    required this.drivingLicense,
    required this.vehicleLicense,
    required this.operatingCard,
    required this.transferDocument,
    required this.verified,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      fullName: json['fullname'],
      phone: json['phone'],
      email: json['email'],
      proofOfIdentityFront: json['proofOfIdentityFront'],
      proofOfIdentityBack: json['proofOfIdentityBack'],
      residenceCardFront: json['residenceCardFront'],
      residenceCardBack: json['residenceCardBack'],
      drivingLicense: json['drivingLicense'],
      vehicleLicense: json['vehicleLicense'],
      operatingCard: json['operatingCard'],
      transferDocument: json['transferDocument'],
      verified: json['verified'],
      token: json['token'],
    );
  }
}
