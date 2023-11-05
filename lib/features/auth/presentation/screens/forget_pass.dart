import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thalj/core/local/cash_helper.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/app_text_style.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/auth/presentation/bloc/otp_bloc/otp_bloc.dart';
import 'package:thalj/features/auth/presentation/components/text_filed.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Image.asset(AppAssets.forgotPass),
              ),
              Text(
                AppStrings.forgotPass,
                textAlign: TextAlign.center,
                style: regularStyle(),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
                return Form(
                  key: ForgetPasswordScreen._formKey,
                  child: MyFormField(
                    controller: _emailController,
                    type: TextInputType.text,
                    hint: "example@mail.com",
                    maxLines: 1,
                    readonly: false,
                    title: 'ادخل البريد الالكتروني',
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (!value.contains("@")) {
                        return AppStrings.vailEmailForm;
                      }
                      return null;
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (ForgetPasswordScreen._formKey.currentState!.validate()) {
                    BlocProvider.of<OtpBloc>(context)
                        .add(ResendOTP(email: _emailController.text));
                    CacheHelper.saveData(
                        key: 'email', value: _emailController.text);
                    CacheHelper.saveData(key: 'screen', value: 'forget');
                    navigatePushNamed(
                        context: context, route: Routes.otpScreen);
                  }
                },
                child: Text(
                  AppStrings.send,
                  style: regularStyle().copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
