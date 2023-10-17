class ErrorMessageModel {
  final String statusMessage;

  const ErrorMessageModel({required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(statusMessage: json["msg"]);
}
