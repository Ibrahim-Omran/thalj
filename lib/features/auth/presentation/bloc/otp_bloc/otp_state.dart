part of 'otp_bloc.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}

final class OtpLoading extends OtpState {
  OtpLoading();
}

class OtpSuccessRegister extends OtpState {
  final String message;
  OtpSuccessRegister({required this.message});
}

class OtpRessendSuccessRegister extends OtpState {
  OtpRessendSuccessRegister();
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
