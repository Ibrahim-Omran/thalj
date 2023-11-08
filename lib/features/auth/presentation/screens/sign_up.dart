import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/local/cash_helper.dart';
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
import '../components/text_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static final _formKey = GlobalKey<FormState>();

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
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _internationalAccountNumController =
      TextEditingController();
  final TextEditingController _accountNumberController =
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
        child: _registerView(context),
      ),
    );
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
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
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
                    controller: _phoneController,
                    type: TextInputType.phone,
                    hint: '000 000 000',
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.phoneNumber,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return AppStrings.phoneNumber;
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
                      if (value != _passwordController.text) {
                        return AppStrings
                            .vailConfirmPassForm; // Error message for password mismatch
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
                    controller: _bankNameController,
                    type: TextInputType.text,
                    hint: "الأهلي",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.bankName,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _internationalAccountNumController,
                    type: TextInputType.text,
                    hint: "SAxxxxxx",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.internatAccNum,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (!value.startsWith('SA')) {
                        return 'يجب ان يبدا ب SA';
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _accountNumberController,
                    type: TextInputType.number,
                    hint: "xxxxxxxxx",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.accNum,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 15.h,
                ),
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
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
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
                                  bankName: _bankNameController.text,
                                  internatAccNum:
                                      _internationalAccountNumController.text,
                                  accNum: _accountNumberController.text,
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
                      navigatePushNamed(
                        context: context,
                        route: Routes.otpScreen,
                      );
                      CacheHelper.saveData(
                          key: 'email', value: _emailController.text);
                      CacheHelper.saveData(key: 'screen', value: 'register');
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
