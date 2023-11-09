import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/local/cash_helper.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';

import '../../../../core/widgets/back_arrow.dart';

// ignore: must_be_immutable
class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});
  late String otp;
  var email = CacheHelper.getData(key: "email");
  var screen = CacheHelper.getData(key: "screen");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpSuccessRegister) {
              navigateAndKill(
                  context: context,
                  route: Routes.uploadingSupportingDocumentsScreen);
            } else if (state is OtpError) {
              showToast(
                text: state.message,
                state: ToastStates.error,
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   const Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackArrow(),
                    ],
                  ),

                  Image.asset(AppAssets.verification),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    borderWidth: 1,
                    disabledBorderColor: AppColors.primary,
                    enabledBorderColor: AppColors.primary,
                    focusedBorderColor: AppColors.darkRed,
                    showFieldAsBox: true,
                    fieldWidth: 50,
                    onSubmit: (value) {
                      otp = value;
                      if (screen == 'register') {
                        BlocProvider.of<OtpBloc>(context)
                            .add(SubmitOTP(email: email, otp: value));
                      } else {

                        navigateAndKill(
                            context: context,
                            route: Routes.resetPass,);
                      }
                      CacheHelper.saveData(key: 'otp', value: value);
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    AppStrings.checkVerifi,
                    style: regularStyle(),
                    textAlign: TextAlign.center,
                  ),
                  state is OtpLoading? const Center(child: CircularProgressIndicator.adaptive()):  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextButton(
                          onPressed: () {
                            BlocProvider.of<OtpBloc>(context)
                                .add(SendOTP(email: email));
                          },
                          child: Text(
                            "اعد ارسال الرمز",
                            style:
                                regularStyle().copyWith(color: AppColors.primary),
                          )),
                      Text(
                        AppStrings.dontReceive,
                        style: regularStyle(),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
