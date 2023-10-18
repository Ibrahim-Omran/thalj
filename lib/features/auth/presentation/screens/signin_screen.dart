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
  SignInScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      if (value.length < 6) {
                        return AppStrings.vailpassForm;
                      }
                      return null;
                    },
                  );
                }),
                Row(children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(AppStrings.forgetPassword,
                        style: underLineStyle()),
                  ),
                ]),
                BlocConsumer<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state.isSubmitting
                        ? const CircularProgressIndicator()
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
                  },
                  listener: (BuildContext context, LoginState state) {
                    if (state.isSuccess) {
                      navigatePushReplacement(context: context, route: Routes.homeScreen);
                      showToast(
                          text: AppStrings.welcome, state: ToastStates.success);
                    }
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        navigatePushNamed(context: context, route: Routes.signup);
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
                        navigatePushNamed(context: context, route: Routes.ownerScreen);
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
