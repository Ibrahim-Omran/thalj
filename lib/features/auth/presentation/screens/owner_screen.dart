import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/commons.dart';

import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';

import '../components/text_filed.dart';

class OwnerScreen extends StatelessWidget {
  OwnerScreen({super.key});

  late bool _isPassword = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _ownerScreenView(context),);
  }

  Widget _ownerScreenView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackArrow(),
                const Center(child: LogoWidget()),
                MyFormField(
                  controller: _userNameController,
                  type: TextInputType.text,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.ownerEmail,
                  hint: 'example@mail.com',
                ),
                MyFormField(
                  controller: _passwordController,
                  prefixIcon: _isPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  prefixIconPressed: () {
                    _isPassword = !_isPassword;
                  },
                  isPassword: _isPassword,
                  type: TextInputType.text,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.passOwner,
                  hint: 'كلمه المرور',
                ),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      navigate(context: context, route: Routes.driverDoc);
                    }
                  },
                  text: AppStrings.signIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
