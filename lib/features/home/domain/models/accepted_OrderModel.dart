class AcceptedOrdersModel {
  AcceptedOrdersModel({
    String? id,
    String? region,
    String? location,
    int? buildingNumber,
    String? floor,
    int? apartmentNumber,
    String? specialSign,
    int? phoneNumber,
    String? regionRecipient,
    String? locationRecipient,
    int? buildingNumberRecipient,
    String? floorRecipient,
    int? apartmentNumberRecipient,
    String? specialSignRecipient,
    int? phoneNumberRecipient,
    String? description,
    String? name,
    String? image,
    int? weight,
    String? humidity,
    int? temperature,
    String? locationFreight,
    String? userId,
    String? date,
    String? status,
    int? paid,
    String? driverId,}){
    _id = id;
    _region = region;
    _location = location;
    _buildingNumber = buildingNumber;
    _floor = floor;
    _apartmentNumber = apartmentNumber;
    _specialSign = specialSign;
    _phoneNumber = phoneNumber;
    _regionRecipient = regionRecipient;
    _locationRecipient = locationRecipient;
    _buildingNumberRecipient = buildingNumberRecipient;
    _floorRecipient = floorRecipient;
    _apartmentNumberRecipient = apartmentNumberRecipient;
    _specialSignRecipient = specialSignRecipient;
    _phoneNumberRecipient = phoneNumberRecipient;
    _description = description;
    _name = name;
    _image = image;
    _weight = weight;
    _humidity = humidity;
    _temperature = temperature;
    _locationFreight = locationFreight;
    _userId = userId;
    _date = date;
    _status = status;
    _paid = paid;
    _driverId = driverId;
  }

  AcceptedOrdersModel.fromJson(dynamic json) {
    _id = json['id'];
    _region = json['region'];
    _location = json['location'];
    _buildingNumber = json['buildingNumber'];
    _floor = json['floor'];
    _apartmentNumber = json['apartmentNumber'];
    _specialSign = json['specialSign'];
    _phoneNumber = json['phoneNumber'];
    _regionRecipient = json['regionRecipient'];
    _locationRecipient = json['locationRecipient'];
    _buildingNumberRecipient = json['buildingNumberRecipient'];
    _floorRecipient = json['floorRecipient'];
    _apartmentNumberRecipient = json['apartmentNumberRecipient'];
    _specialSignRecipient = json['specialSignRecipient'];
    _phoneNumberRecipient = json['phoneNumberRecipient'];
    _description = json['description'];
    _name = json['name'];
    _image = json['image'];
    _weight = json['weight'];
    _humidity = json['humidity'];
    _temperature = json['temperature'];
    _locationFreight = json['locationFreight'];
    _userId = json['user_id'];
    _date = json['date'];
    _status = json['status'];
    _paid = json['paid'];
    _driverId = json['driverId'];
  }
  String? _id;
  String? _region;
  String? _location;
  int? _buildingNumber;
  String? _floor;
  int? _apartmentNumber;
  String? _specialSign;
  int? _phoneNumber;
  String? _regionRecipient;
  String? _locationRecipient;
  int? _buildingNumberRecipient;
  String? _floorRecipient;
  int? _apartmentNumberRecipient;
  String? _specialSignRecipient;
  int? _phoneNumberRecipient;
  String? _description;
  String? _name;
  String? _image;
  int? _weight;
  String? _humidity;
  int? _temperature;
  String? _locationFreight;
  String? _userId;
  String? _date;
  String? _status;
  int? _paid;
  String? _driverId;

  String? get id => _id;
  String? get region => _region;
  String? get location => _location;
  int? get buildingNumber => _buildingNumber;
  String? get floor => _floor;
  int? get apartmentNumber => _apartmentNumber;
  String? get specialSign => _specialSign;
  int? get phoneNumber => _phoneNumber;
  String? get regionRecipient => _regionRecipient;
  String? get locationRecipient => _locationRecipient;
  int? get buildingNumberRecipient => _buildingNumberRecipient;
  String? get floorRecipient => _floorRecipient;
  int? get apartmentNumberRecipient => _apartmentNumberRecipient;
  String? get specialSignRecipient => _specialSignRecipient;
  int? get phoneNumberRecipient => _phoneNumberRecipient;
  String? get description => _description;
  String? get name => _name;
  String? get image => _image;
  int? get weight => _weight;
  String? get humidity => _humidity;
  int? get temperature => _temperature;
  String? get locationFreight => _locationFreight;
  String? get userId => _userId;
  String? get date => _date;
  String? get status => _status;
  int? get paid => _paid;
  String? get driverId => _driverId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['region'] = _region;
    map['location'] = _location;
    map['buildingNumber'] = _buildingNumber;
    map['floor'] = _floor;
    map['apartmentNumber'] = _apartmentNumber;
    map['specialSign'] = _specialSign;
    map['phoneNumber'] = _phoneNumber;
    map['regionRecipient'] = _regionRecipient;
    map['locationRecipient'] = _locationRecipient;
    map['buildingNumberRecipient'] = _buildingNumberRecipient;
    map['floorRecipient'] = _floorRecipient;
    map['apartmentNumberRecipient'] = _apartmentNumberRecipient;
    map['specialSignRecipient'] = _specialSignRecipient;
    map['phoneNumberRecipient'] = _phoneNumberRecipient;
    map['description'] = _description;
    map['name'] = _name;
    map['image'] = _image;
    map['weight'] = _weight;
    map['humidity'] = _humidity;
    map['temperature'] = _temperature;
    map['locationFreight'] = _locationFreight;
    map['user_id'] = _userId;
    map['date'] = _date;
    map['status'] = _status;
    map['paid'] = _paid;
    map['driverId'] = _driverId;
    return map;
  }

}