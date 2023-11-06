import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/widgets/back_arrow.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/commons.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/components/text_filed.dart';
import '../../bloc/editInfo/editInfo_bloc.dart';
import '../../bloc/editInfo/editInfo_event.dart';
import '../../bloc/editInfo/editInfo_state.dart';

class EditPasswordPro extends StatefulWidget {
  const EditPasswordPro({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditPasswordPro> createState() => _EditPasswordProState();
}

class _EditPasswordProState extends State<EditPasswordPro> {
  late bool _isPassword = true;
  late bool _isConfirmPassword = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: EditPasswordPro._formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackArrow(),
                  ],
                ),
                const Spacer(),
                BlocBuilder<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _passwordController,
                    prefixIcon: _isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    prefixIconPressed: () {
                      _isPassword = !_isPassword;
                      BlocProvider.of<EditInfoBloc>(context)
                          .add(EditToggleObscureText(isPassword: _isPassword));
                    },
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.editPassword,
                    hint: AppStrings.password,
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
                  height: 20.h,
                ),
                BlocBuilder<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                  return MyFormField(
                    controller: _confirmPasswordController,
                    prefixIcon: _isConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    prefixIconPressed: () {
                      _isConfirmPassword = !_isConfirmPassword;
                      BlocProvider.of<EditInfoBloc>(context).add(
                          EditToggleConfirmedObscureText(
                              isConfirmedPassword: _isConfirmPassword));
                    },
                    isPassword: _isConfirmPassword,
                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.confirmPassword,
                    hint: 'تآكيد كلمه المرور',
                    vaild: (value) {

                      if (value != _passwordController.text) {
                        return AppStrings
                            .vailConfirmPassForm; // Error message for password mismatch
                      }
                      return null;
                    },
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                const Spacer(),
                BlocConsumer<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                  return state.isSubmitting
                      ? const CircularProgressIndicator.adaptive()
                      : CustomButton(
                          onPressed: () {
                            if (EditPasswordPro._formKey.currentState!
                                .validate()) {
                              BlocProvider.of<EditInfoBloc>(context)
                                  .add(EditPasswordSubmitted(
                                password: _passwordController.text,
                              ));
                            }
                          },
                          text: AppStrings.changeInfo,
                        );
                }, listener: (context, state) {
                  if (state.isSuccess) {
                    navigatePushReplacement(
                        context: context, route: Routes.signIN);
                    showToast(
                        text: AppStrings.editInfoSuccess,
                        state: ToastStates.success);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
