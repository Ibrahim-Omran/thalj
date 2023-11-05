part of 'otp_bloc.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {
  final int? time;
  OtpLoading({this.time});
}

class OtpSuccessRegister extends OtpState {
  final String message;
  OtpSuccessRegister({required this.message});
}

class OtpSendEmailSuccess extends OtpState {
  final String message;
  OtpSendEmailSuccess({required this.message});
}

class OtpSuccessResetPass extends OtpState {
  final String message;
  OtpSuccessResetPass({required this.message});
}

class OtpError extends OtpState {
  final String message;
  OtpError({required this.message});
}
