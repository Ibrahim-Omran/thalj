import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../../domain/repository.dart';
import '../bloc/register_bloc/bloc_register.dart';
import '../bloc/register_bloc/bloc_register_events.dart';
import '../bloc/register_bloc/bloc_register_states.dart';
import '../components/phone_form_field.dart';
import '../components/text_filed.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _isChecked = false;

  late bool _isPassword = true;

  late bool _isConfirmPassword = true;

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
            key: SignUpScreen._formKey,
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
                PhoneForm(
                  controller: _phoneController,
                ),
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
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (!value.contains("@")) {
                        return AppStrings.vailEmailForm;
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
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
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (value.length < 6) {
                        return AppStrings.vailpassForm;
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
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
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (value.length < 6) {
                        return AppStrings.vailpassForm;
                      }
                      if (value != _passwordController.text) {
                        return AppStrings
                            .vailConfirmPassForm; // Error message for password mismatch
                      }
                      return null;
                    },
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
                            BlocProvider.of<RegisterBloc>(context)
                                .add(ToggleCheckbox(isChecked: _isChecked));
                          });
                    },
                  ),
                ]),
                BlocConsumer<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return state.isSubmitting
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            onPressed: () {
                              if (SignUpScreen._formKey.currentState!
                                      .validate() &&
                                  _isChecked == true) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(RegisterSubmitted(
                                  name: _userNameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  phone: _phoneController.text,
                                ));
                              }
                              if (_isChecked == false) {
                                showToast(
                                    text: "يجب قبول الشروط و الاحكام",
                                    state: ToastStates.warning);
                              }
                            },
                            text: AppStrings.saveAndCompleteProject,
                          );
                  },
                  listener: (BuildContext context, RegisterState state) {
                    if (state.isSuccess) {
                      navigatePushReplacement(
                          context: context,
                          route: Routes.uploadingSupportingDocumentsScreen);
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
