import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/widgets/back_arrow.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/components/text_filed.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditInfo> createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  late bool _isPassword = true;



  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: EditInfo._formKey,
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackArrow(),
                    ],
                  ),
                SizedBox(height: 40.h,),
                MyFormField(
                controller: _userNameController,
                type: TextInputType.text,
                hint: "محمد",
                maxLines: 1,
                readonly: false,
                title: AppStrings.userName,
                  vaild: (value){
                    if (value!.isEmpty) {
                      return AppStrings.vaildForm;
                    }
                    return null;
                  },
              ),
              SizedBox(height: 20.h,),
              MyFormField(
                controller: _emailController,
                type: TextInputType.text,
                hint: "example@mail.com",
                maxLines: 1,
                readonly: false,
                title: AppStrings.editEmail,
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
                SizedBox(height: 20.h,),
              MyFormField(
                controller: _passwordController,
                prefixIcon: true
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                prefixIconPressed: () {

                },
                isPassword: true,
                type: TextInputType.text,
                maxLines: 1,
                readonly: false,
                title: AppStrings.createPassword,
                hint: 'كلمه المرور',
                vaild: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.vaildForm;
                  }
                  if (value.length < 6) {
                    return AppStrings.vailpassForm;
                  }
                  return null;
                },
              ),
                SizedBox(height: 20.h,),
                MyFormField(
                  controller: _emailController,
                  type: TextInputType.text,
                  hint: "01151827070",
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.phoneNumber,
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
                SizedBox(height: 70.h,),
              CustomButton(
                onPressed: () {
                  if(EditInfo._formKey.currentState!
                      .validate())
                    {

                    }

                },
                text: AppStrings.saveAndCompleteProject,
              ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
