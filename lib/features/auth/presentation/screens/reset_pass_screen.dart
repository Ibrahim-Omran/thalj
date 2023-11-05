import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:thalj/features/auth/presentation/components/text_filed.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  var otp = CacheHelper.getData(key: "otp");
  var email = CacheHelper.getData(key: "email");
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset(AppAssets.resetPass),
              ),
              Text(
                AppStrings.newPass,
                style: boldStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Form(
                key: ResetPassScreen._formKey1,
                child: Column(
                  children: [
                    MyFormField(
                      controller: _passwordController,
                      type: TextInputType.text,
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.createPassword,
                      hint: 'كلمه المرور',
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.vaildForm;
                        }
                        if (value.length < 8) {
                          return AppStrings.vailpassForm;
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one capital letter';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MyFormField(
                      controller: _confirmPasswordController,
                      type: TextInputType.text,
                      maxLines: 1,
                      readonly: false,
                      title: AppStrings.confirmPassword,
                      hint: 'تآكيد كلمه المرور',
                      vaild: (value) {
                        if (value!.isEmpty) {
                          return AppStrings.vaildForm;
                        }
                        if (value.length < 8) {
                          return AppStrings.vailpassForm;
                        }
                        if (!value.contains(RegExp(r'[A-Z]'))) {
                          return 'Password must contain at least one capital letter';
                        }
                        if (value != _passwordController.text) {
                          return AppStrings
                              .vailConfirmPassForm; // Error message for password mismatch
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocListener<OtpBloc, OtpState>(
                  listener: (context, state) {
                    if (state is OtpError) {
                      showToast(
                          text: 'Your Otp is wrong Please Check again',
                          state: ToastStates.error);
                      BlocProvider.of<OtpBloc>(context)
                          .add(ResendOTP(email: email));
                      Navigator.of(context).pop();
                    } else if (state is OtpSuccessResetPass) {
                      showToast(
                          text: state.message, state: ToastStates.success);
                      navigatePushNamed(context: context, route: Routes.signIN);
                    } else if (state is OtpLoading) {
                      showToast(
                          text: 'Please Wait', state: ToastStates.success);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () {
                      if (ResetPassScreen._formKey1.currentState!.validate()) {
                        BlocProvider.of<OtpBloc>(context).add(ResetPassOtp(
                            email: email,
                            otp: otp,
                            pass: _passwordController.text));
                      }
                    },
                    child: Text(
                      AppStrings.send,
                      style: regularStyle().copyWith(color: AppColors.white),
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
