import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/core/widgets/custom_button.dart';
import 'package:thalj/core/widgets/logo.dart';
import 'package:thalj/features/auth/domain/repository.dart';

import '../../../../core/utils/app_text_style.dart';
import '../bloc/login_bloc/bloc_login.dart';

import '../bloc/login_bloc/bloc_login_events.dart';
import '../bloc/login_bloc/bloc_login_states.dart';
import '../components/text_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static final  _formKey = GlobalKey<FormState>();


  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late bool _isPassword = true;

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocProvider(
          create: (context) =>
              LoginBloc(authRepository: context.read<AuthRepository>()),
          child: _loginView(context)),
    );
  }

  Widget _loginView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: SignInScreen._formKey,
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
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  return MyFormField(
                    controller: _userNameController,
                    type: TextInputType.text,
                    hint: "example@mail.com",
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.emailOrPhone,
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
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  return MyFormField(
                    controller: _passwordController,
                    prefixIcon: _isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    prefixIconPressed: () {
                      _isPassword = !_isPassword;
                      BlocProvider.of<LoginBloc>(context)
                          .add(LoginToggleObscureText(isPassword: _isPassword));
                    },
                    isPassword: _isPassword,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.password,
                    hint: 'كلمه المرور',
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
                      }
                      if (value.length < 8) {
                        return AppStrings.vailpassForm;
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
                Row(children: [
                  TextButton(
                    onPressed: () {
                      navigatePushNamed(
                          context: context, route: Routes.forgetPass);
                    },
                    child: Text(AppStrings.forgetPassword,
                        style: underLineStyle()),
                  ),
                ]),
                BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
                  return state.isSubmitting
                      ? const CircularProgressIndicator.adaptive()
                      : CustomButton(
                          onPressed: () {
                            if (SignInScreen._formKey.currentState!
                                .validate()) {
                              BlocProvider.of<LoginBloc>(context)
                                  .add(LoginSubmitted(
                                email: _userNameController.text,
                                password: _passwordController.text,
                              ));
                            }
                          },
                          text: AppStrings.signIn,
                        );
                }, listener: (BuildContext context, LoginState state) {
                  final loginData = state.loginData;

                  if (state.isSuccess &&
                      loginData != null &&
                      loginData.data.isNotEmpty) {
                    final isVerified = loginData.data.first.verified;
                    if (isVerified == "1") {
                      navigatePushReplacement(
                          context: context,
                          route: Routes.homeScreen,
                          arg: state.loginData);
                      showToast(
                          text: AppStrings.welcome, state: ToastStates.success);
                    } else if (isVerified == "0") {
                      showToast(
                          text: AppStrings.verifyMessage,
                          state: ToastStates.warning);
                    }
                  }
                }),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigatePushNamed(
                            context: context, route: Routes.signUp);
                      },
                      child: Text(
                        AppStrings.subscription,
                        style: underLineStyle(),
                      ),
                    ),
                    Text(
                      AppStrings.donAccount,
                      style: regularStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigatePushNamed(
                            context: context, route: Routes.ownerScreen);
                      },
                      child: Text(
                        AppStrings.pressHere,
                        style: underLineStyle(),
                      ),
                    ),
                    Text(
                      AppStrings.register,
                      style: regularStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
