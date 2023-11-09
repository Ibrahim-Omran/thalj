import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thalj/core/utils/toast.dart';
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
          emit(OtpSuccessRegister(message: 'الرمز صحيح'));
        } else {
          emit(OtpError(message: 'الرمز خطا'));
        }
      } else if (event is SendOTP) {
        emit(OtpLoading());
        var isSended = await _authRepository.sendOTPToEmail(event.email);


        if (isSended!) {
          showToast(text: "تم ارسال الرمز", state: ToastStates.success);
          emit(OtpRessendSuccessRegister());
        } else {
          emit(OtpError(message: 'لم يتم ارسال الرمز تحقق من الايميل'));
        }
      } else if (event is ResendOTP) {
        emit(OtpLoading());
        var isSended = await _authRepository.sendOTPToEmailReset(event.email);

        if (isSended!) {
          showToast(text: "تم ارسال الرمز", state: ToastStates.success);


          emit(OtpSendEmailSuccess());
        } else {
          emit(OtpError(message: 'لم يتم ارسال الرمز تحقق من الايميل'));
        }
      } else if (event is SubmitOtpResetPass) {
        showToast(text: "تم ارسال الرمز", state: ToastStates.success);

        emit(OtpSendEmailSuccess());
      } else if (event is ResetPassOtp) {
        emit(OtpLoading());
        var isSended = await _authRepository.sendOTPResetPass(
            event.email, event.otp, event.pass);
        if (isSended!) {
          emit(OtpSuccessResetPass(
              message: 'تم تغير كلمة المرور بنجاح'));
        } else {
          emit(OtpError(
              message:
                  'الرمز غير صحيح برجاء المحاولة مرة اخرى'));
        }
      }
    });
  }
}
