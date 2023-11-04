part of 'otp_bloc.dart';

@immutable
sealed class OtpEvent {}

class SubmitOTP extends OtpEvent {
  final String otp;
  final String email;
  SubmitOTP({required this.email, required this.otp});
}

class SendOTP extends OtpEvent {
  final String email;
  SendOTP({required this.email});
}

class ResendOTP extends OtpEvent {
  final String email;
  ResendOTP({required this.email});
}

class ResetPassOtp extends OtpEvent {
  final String otp;
  final String email;
  final String pass;
  ResetPassOtp({required this.email, required this.otp, required this.pass});
}
