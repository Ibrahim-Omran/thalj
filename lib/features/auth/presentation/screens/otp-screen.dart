import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  late String otp;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      body: SafeArea(
          child: BlocListener<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccessRegister) {
            navigatePushReplacement(
                context: context,
                route: Routes.uploadingSupportingDocumentsScreen);
          } else if (state is OtpSuccessResetPass) {
            navigatePushReplacement(
                context: context,
                route: Routes.resetPass,
                arg: {"email": args["email"], "otp": otp});
          } else if (state is OtpError) {
            showToast(
              text: state.message,
              state: ToastStates.error,
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset(AppAssets.verification),
            ),
            Text(
              AppStrings.verification,
              style: boldStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            OtpTextField(
              borderColor: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderWidth: 1,
              disabledBorderColor: AppColors.primary,
              enabledBorderColor: AppColors.primary,
              focusedBorderColor: AppColors.darkRed,
              showFieldAsBox: true,
              fieldWidth: 50,
              onSubmit: (value) {
                print('vallll$value');
                otp = value;
                BlocProvider.of<OtpBloc>(context)
                    .add(SubmitOTP(email: args['email'], otp: value));
              },
            ),
          ],
        ),
      )),
    );
  }
}
