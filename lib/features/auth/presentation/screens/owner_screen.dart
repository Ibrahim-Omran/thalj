import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/commons.dart';

import 'package:thalj/core/widgets/custom_button.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/toast.dart';
import '../../../../core/widgets/logo.dart';
import '../../../../core/widgets/back_arrow.dart';

import '../../domain/repository.dart';
import '../bloc/owner_login_bloc/bloc__owner_login_events.dart';
import '../bloc/owner_login_bloc/bloc__owner_login_states.dart';
import '../bloc/owner_login_bloc/bloc_owner_login.dart';
import '../components/text_filed.dart';

class OwnerScreen extends StatefulWidget {
  OwnerScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
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
      body: BlocProvider(
          create: (context) =>
              AdminLoginBloc(authRepository: context.read<AuthRepository>()),
          child: _ownerScreenView(context)),
    );
  }

  Widget _ownerScreenView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: OwnerScreen._formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackArrow(),
                const Center(child: LogoWidget()),
                BlocBuilder<AdminLoginBloc, AdminLoginState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _userNameController,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.ownerEmail,
                    hint: 'example@mail.com',
                  );
                }),
                BlocBuilder<AdminLoginBloc, AdminLoginState>(
                    builder: (context, state) {
                  return MyFormField(
                    prefixIconPressed: () {
                      _isPassword = !_isPassword;
                      BlocProvider.of<AdminLoginBloc>(context).add(
                          AdminLoginToggleObscureText(isPassword: _isPassword));
                    },
                    controller: _passwordController,
                    prefixIcon: _isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    isPassword: _isPassword,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.passOwner,
                    hint: 'كلمه المرور',
                  );
                }),
                SizedBox(
                  height: 40.h,
                ),
                BlocConsumer<AdminLoginBloc, AdminLoginState>(
                  builder: (context, state) {
                    return state.isSubmitting
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            onPressed: () {
                              if (OwnerScreen._formKey.currentState!
                                  .validate()) {
                                BlocProvider.of<AdminLoginBloc>(context)
                                    .add(AdminLoginSubmitted(
                                  email: _userNameController.text,
                                  password: _passwordController.text,
                                ));
                              }
                            },
                            text: AppStrings.signIn,
                          );
                  },
                  listener: (BuildContext context, AdminLoginState state) {
                    if (state.isSuccess) {
                      navigatePushReplacement(context: context, route: Routes.driverDoc);
                      showToast(
                          text: AppStrings.welcome, state: ToastStates.success);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
