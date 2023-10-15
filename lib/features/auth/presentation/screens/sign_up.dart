import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../../domain/repository.dart';
import '../components/phone_form_field.dart';
import '../components/text_filed.dart';
import '../login_bloc/register_bloc/bloc_register.dart';
import '../login_bloc/register_bloc/bloc_register_events.dart';
import '../login_bloc/register_bloc/bloc_register_states.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  late bool _isChecked = false;
  late bool _isPassword = true;
  late bool _isConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final PhoneController _phoneController = PhoneController(null);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) =>
                RegisterBloc(authRepository: context.read<AuthRepository>()),
            child: _registerView(context)));
  }

  Widget _registerView(BuildContext context) {
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
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _userNameController,
                    type: TextInputType.text,
                    hint: "محمد",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.signUpHint,
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return PhoneForm(
                    controller: _phoneController,
                    onSubmit: (value) => BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterPhone(phone: value)),
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _emailController,
                    type: TextInputType.text,
                    hint: "example@mail.com",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.email,
                    onSubmit: (value) => BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterEmail(email: value)),
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    onSubmit: (value) => BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterPassword(password: value)),
                    controller: _passwordController,
                    prefixIcon: _isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    prefixIconPressed: () {
                      _isPassword = !_isPassword;
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterToggleObscureText(isPassword: _isPassword));
                    },
                    isPassword: _isPassword,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.createPassword,
                    hint: 'كلمه المرور',
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    onSubmit: (value) => BlocProvider.of<RegisterBloc>(context)
                        .add(RegisterConfirmPassword(confirmPassword: value)),
                    controller: _confirmPasswordController,
                    prefixIcon: _isConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    prefixIconPressed: () {
                      _isConfirmPassword = !_isConfirmPassword;
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterToggleConfirmObscureText(
                              isConfirmPassword: _isConfirmPassword));
                    },
                    isPassword: _isConfirmPassword,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.confirmPassword,
                    hint: 'تآكيد كلمه المرور',
                  );
                }),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(AppStrings.agreeTermAndConditions,
                      style: regularStyle()),
                  BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                      return Checkbox(
                          value: _isChecked,
                          onChanged: (bool? value) {
                            _isChecked = !_isChecked;
                            BlocProvider.of<RegisterBloc>(context).add(ToggleCheckbox(isChecked: _isChecked));
                          });
                    },
                  ),
                ]),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<RegisterBloc>(context)
                            .add(RegisterSubmitted());
                        /*navigate(
                           context: context,
                           route: Routes.uploadingSupportingDocumentsScreen);*/
                      }
                    },
                    text: AppStrings.saveAndCompleteProject,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
