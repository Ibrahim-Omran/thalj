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
  static final _formKey1 = GlobalKey<FormState>();
  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();
  var otp = CacheHelper.getData(key: "otp");
  var email = CacheHelper.getData(key: "email");
  bool _isPassword = true;
  bool _isConfirmedPass = true;
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
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.resetPass),
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
                  prefixIcon: _isPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  prefixIconPressed: () {
                    setState(() {
                      _isPassword = !_isPassword;

                    });
                  },
                  isPassword: _isPassword,
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
                      return AppStrings.vailpassForm1;
                    }
                    if (!value.contains(RegExp(r'[A-Z]'))) {
                      return 'يجب وجود على الاقل حرف كبير';
                    }
                    if (value.replaceAll(RegExp(r'[^0-9]'), '').length < 2) {
                      return 'يجب وجود على الأقل رقمين';
                    }
                    return null;
                  },
                ),
                    SizedBox(
                      height: 30.h,
                    ),
                MyFormField(
                  controller: _confirmPasswordController,
                  prefixIcon: _isConfirmedPass
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  prefixIconPressed: () {
                    setState(() {
                      _isConfirmedPass = !_isConfirmedPass;

                    });
                  },
                  isPassword: _isConfirmedPass,
                  type: TextInputType.text,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.confirmPassword,
                  hint: 'تآكيد كلمه المرور',
                  vaild: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.vaildForm;
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
              BlocConsumer<OtpBloc, OtpState>(
                  listener: (context, state) {
                    if (state is OtpError) {
                      showToast(
                          text: state.message,
                          state: ToastStates.error);

                      navigatePushNamed(context: context, route: Routes.otpScreen);
                    } else if (state is OtpSuccessResetPass) {
                      showToast(
                          text: state.message, state: ToastStates.success);
                      navigateAndKill(context: context, route: Routes.signIN);
                    }
                  },
                  builder: (context,state)=>state is OtpLoading? const Center(child: CircularProgressIndicator.adaptive())  :ElevatedButton(
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
                  )), ]),

          ),
        ),
      )
    );

  }
}
