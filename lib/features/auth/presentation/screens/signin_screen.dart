import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/features/auth/presentation/components/logo.dart';

import '../../../../core/utils/app_text_style.dart';
import '../components/button.dart';
import '../components/text_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _isChecked = false;
  late bool _isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const LogoWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.signIn,
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
                      AppStrings.signInHint,
                      style: regularStyle(),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 15.h,
                ),
                MyFormField(
                  type: TextInputType.text,
                  hint: "example@mail.com",
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.emailOrPhone,
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
                  title: AppStrings.password,
                  hint: 'كلمه المرور',
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  TextButton(

                        onPressed: () {},
                    child: Text(
                      AppStrings.forgetPassword,
                      style: underLineStyle()
                    ),
                  ),
                  Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      }),
                ]),
                PublicButton(backgroundColor: AppColors.primary, function: () {
                  navigate(context: context, route: Routes.homeScreen);
                }, text: AppStrings.signIn,),
                 SizedBox(height: 15.h,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 TextButton(onPressed: (){
                   navigate(context: context, route: Routes.signup);
                 }, child:  Text(AppStrings.subscription,style: underLineStyle(),),),

                  Text(AppStrings.donAccount,style: regularStyle(),),


                ],),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){
                      navigate(context: context, route: Routes.ownerScreen);
                    }, child:  Text(AppStrings.pressHere,style: underLineStyle(),),),

                  Text(AppStrings.register,style: regularStyle(),),


                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
