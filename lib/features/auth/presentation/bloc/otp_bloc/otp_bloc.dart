import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/features/auth/domain/repository.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository _authRepository;
  OtpBloc(this._authRepository) : super(OtpInitial()) {
    on<OtpEvent>((event, emit) async {
      if (event is SubmitOTP) {
        emit(OtpLoading());
        var isSended =
            await _authRepository.sendOTPWithEmail(event.email, event.otp);
        if (isSended) {
          emit(OtpSuccessRegister(message: 'OTP is correct'));
        } else {
          emit(OtpError(message: 'OTP is not correct'));
        }
      } else if (event is SendOTP) {
        emit(OtpLoading());
        var isSended = await _authRepository.sendOTPToEmail(event.email);

        if (isSended) {
          emit(OtpSuccessRegister(message: 'OTP is sended'));
        } else {
          emit(OtpError(message: 'OTP is not sended Please Check your Email'));
        }
      } else if (event is ResendOTP) {
        emit(OtpLoading(time: 2));
        var isSended = await _authRepository.sendOTPToEmailReset(event.email);
        if (isSended) {
          emit(OtpSuccessResetPass(message: 'OTP is sended'));
        } else {
          emit(OtpError(message: 'OTP is not sended Please Check your Email'));
        }
      } else if (event is ResetPassOtp) {
        emit(OtpLoading());
        var isSended = await _authRepository.sendOTPResetPass(
            event.email, event.otp, event.pass);
        if (isSended) {
          emit(OtpSuccessResetPass(
              message: 'Your Password has Changed Successfully'));
        } else {
          emit(OtpError(
              message:
                  'OTP or Email is not Correct Please Check your OTP or Email'));
        }
      }
    });
  }
}
