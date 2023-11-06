import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/widgets/back_arrow.dart';
import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/local/cash_helper.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/logo.dart';
import '../bloc/otp_bloc/otp_bloc.dart';
import '../components/text_filed.dart';

class EmailScreen extends StatelessWidget {
   EmailScreen({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackArrow(),
              ],
            ),
            const LogoWidget(),


            MyFormField(
            controller: _emailController,
            type: TextInputType.text,
            hint: "example@mail.com",
            maxLines: 1,
            readonly: false,
            title: AppStrings.email,
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
          SizedBox(
            height: 15.h,
          ),
          CustomButton(onPressed: ()async{

            BlocProvider.of<OtpBloc>(context)
                .add(SendOTP(email: _emailController.text));
            navigatePushNamed(context: context, route: Routes.otpScreen, );

            await CacheHelper.saveData(key: 'screen', value: 'register');
           await  CacheHelper.saveData(key: 'email', value: _emailController.text);

          }, text: "التالي")

        ],),
      ),
    ),);
  }
}
