class LoginModel {
  final List<UserInfo> data;
  final String token;
  final int daysUntilExpiry;

  LoginModel({
    required this.data,
    required this.token,
    required this.daysUntilExpiry,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> data = json['data'] ?? [];
    final List<UserInfo> userInfoList = data.map((userData) {
      return UserInfo.fromJson(userData);
    }).toList();

    return LoginModel(
      data: userInfoList,
      token: json['token'] ?? "",
      daysUntilExpiry: json['daysUntilExpiry'] ?? 0,
    );
  }
}

class UserInfo {
  final String id;
  final String fullname;
  final int phone;
  final String email;
  final String proofOfIdentityFront;
  final String proofOfIdentityBack;
  final String drivingLicense;
  final String vehicleLicense;
  final String operatingCard;
  final String transferDocument;
  final String verified;
  final int subscription;
  final String subscriptionDate;
  final String status;
  final String commercialRegister;
  final int activate;
  final String bankName;
  final String internationalAccountNum;
  final int accountNumber;

  UserInfo({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.proofOfIdentityFront,
    required this.proofOfIdentityBack,
    required this.drivingLicense,
    required this.vehicleLicense,
    required this.operatingCard,
    required this.transferDocument,
    required this.verified,
    required this.subscription,
    required this.subscriptionDate,
    required this.status,
    required this.commercialRegister,
    required this.activate,
    required this.bankName,
    required this.internationalAccountNum,
    required this.accountNumber,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] ?? "",
      fullname: json['fullname'] ?? "",
      phone: json['phone'] ?? 0,
      email: json['email'] ?? "",
      proofOfIdentityFront: json['proofOfIdentityFront'] ?? "",
      proofOfIdentityBack: json['proofOfIdentityBack'] ?? "",
      drivingLicense: json['drivingLicense'] ?? "",
      vehicleLicense: json['vehicleLicense'] ?? "",
      operatingCard: json['operatingCard'] ?? "",
      transferDocument: json['transferDocument'] ?? "",
      verified: json['verified'] ?? "",
      subscription: json['subscription'] ?? 0,
      subscriptionDate: json['subscription_date'] ?? "",
      status: json['status'] ?? "",
      commercialRegister: json['commercialRegister'] ?? "",
      activate: json['activate'] ?? 0,
      bankName: json['bankName'] ?? "",
      internationalAccountNum: json['internationalAccountNum'] ?? "",
      accountNumber: json['accountNumber'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'phone': phone,
      'email': email,
      'proofOfIdentityFront': proofOfIdentityFront,
      'proofOfIdentityBack': proofOfIdentityBack,
      'drivingLicense': drivingLicense,
      'vehicleLicense': vehicleLicense,
      'operatingCard': operatingCard,
      'transferDocument': transferDocument,
      'verified': verified,
      'subscription': subscription,
      'subscription_date': subscriptionDate,
      'status': status,
      'commercialRegister': commercialRegister,
      'activate': activate,
      'bankName': bankName,
      'internationalAccountNum': internationalAccountNum,
      'accountNumber': accountNumber,
    };
  }
}
