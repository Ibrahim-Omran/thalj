class ErrorMessageModel  {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorMessageModel({required this.success,
    required this.statusCode,
    required this.statusMessage});
}