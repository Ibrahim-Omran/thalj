import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/widgets/back_arrow.dart';
import 'package:thalj/features/home/presentation/bloc/editInfo/editInfo_event.dart';
import 'package:thalj/features/home/presentation/bloc/editInfo/editInfo_state.dart';

import '../../../../../core/local/cash_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/commons.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/components/text_filed.dart';
import '../../../domain/repository.dart';
import '../../bloc/editInfo/editInfo_bloc.dart';

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
          child: BlocProvider(
              create: (context) =>
                  EditInfoBloc(homeRepository: context.read<HomeRepository>()),
              child: _body(context))),
    );
  }
  String name = CacheHelper.getData(key: 'name');
  String email = CacheHelper.getData(key: 'email');

  var phone = CacheHelper.getData(key: 'phone');


  Widget _body(BuildContext context) {
    return Padding(
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
              SizedBox(
                height: 40.h,
              ),
              BlocBuilder<EditInfoBloc, EditInfoState>(
                  builder: (context, state) {

                return MyFormField(
                  controller: _userNameController,
                  type: TextInputType.text,
                  hint: name,
                  maxLines: 1,
                  readonly: false,
                  title: AppStrings.userName,
                  vaild: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.vaildForm;
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
                    controller: _emailController,
                    type: TextInputType.text,
                    hint: email,
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

                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<EditInfoBloc, EditInfoState>(
                builder: (context, state) {
                  return MyFormField(
                    controller: _phoneController,
                    type: TextInputType.text,
                    hint: phone.toString(),
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.editEmail,
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
                },
              ),
              SizedBox(
                height: 70.h,
              ),
              BlocConsumer<EditInfoBloc, EditInfoState>(
                  builder: (context, state) {
                return state.isSubmitting
                    ? const CircularProgressIndicator.adaptive()
                    : CustomButton(
                        onPressed: () {
                          if(EditInfo._formKey.currentState!.validate()){
                            BlocProvider.of<EditInfoBloc>(context)
                                .add(EditInfoSubmitted(
                              name: _userNameController.text ,
                              phone: _phoneController.text,
                              email: _emailController.text,
                            ));
                          }
                        },
                        text: AppStrings.saveAndCompleteProject,
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
    );
  }
}
