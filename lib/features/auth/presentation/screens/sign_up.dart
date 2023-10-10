import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';
import '../components/logo.dart';
import '../components/back_arrow.dart';
import '../components/button.dart';
import '../components/phone_form_field.dart';
import '../components/text_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _isChecked = false;
  late bool _isPassword = true;
  late bool _isConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackArrow(),
                const Center(child: LogoWidget()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.signUp,
                      style: boldStyle(),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.signUpHint,
                      style: regularStyle(),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 15.h,
                ),
                MyFormField(
                  type: TextInputType.text,
                  hint: "محمد",
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.signUpHint,
                ),
                 SizedBox(
                  height: 15.h,
                ),
                const PhoneForm(),
                 SizedBox(
                  height: 15.h,
                ),
                MyFormField(
                  type: TextInputType.text,
                  hint: "example@mail.com",
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.email,
                ),
                 SizedBox(
                  height: 15.h,
                ),
                MyFormField(
                  prefixIcon: _isPassword ?Icons.visibility_outlined:Icons.visibility_off_outlined,
                  prefixIconPressed:(){
                    setState(() {
                      _isPassword = !_isPassword;
                    });


                  } ,
                  isPassword: _isPassword,
                  type: TextInputType.text,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.createPassword,
                  hint: 'كلمه المرور',
                ),
                 SizedBox(
                  height: 15.h,
                ),
                MyFormField(
                  prefixIcon: _isConfirmPassword ?Icons.visibility_outlined:Icons.visibility_off_outlined,
                  prefixIconPressed:(){
                    setState(() {
                      _isConfirmPassword = !_isConfirmPassword;
                    });


                  } ,
                  isPassword: _isConfirmPassword,
                  type: TextInputType.text,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.confirmPassword,
                  hint: 'تآكيد كلمه المرور',
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          AppStrings.agreeTermAndConditions,
                          style: regularStyle()
                      ),
                  Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      }),
                ]),
                PublicButton(backgroundColor: AppColors.primary, function: () {  }, text: AppStrings.saveAndCompleteProject,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
