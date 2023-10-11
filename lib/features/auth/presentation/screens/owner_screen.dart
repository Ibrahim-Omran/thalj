import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../components/text_filed.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  late bool _isPassword = true;

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
                MyFormField(
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
                  title: AppStrings.passOwner,
                  hint: 'كلمه المرور',
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomButton(
                  onPressed: () {},
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
