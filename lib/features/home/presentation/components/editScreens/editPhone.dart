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

class EditPhonePro extends StatefulWidget {
  const EditPhonePro({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditPhonePro> createState() => _EditPhoneProState();
}

class _EditPhoneProState extends State<EditPhonePro> {
  final TextEditingController _phoneController = TextEditingController();


  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Form(
          key:EditPhonePro._formKey ,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackArrow(),
                  ],
                ),




                BlocBuilder<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                      return MyFormField(
                        controller: _phoneController,

                        type: TextInputType.text,
                        maxLines: 1,
                        readonly: false,
                        title: AppStrings.phone,
                        hint: AppStrings.phoneNumber,
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return AppStrings.vaildForm;
                          }
                          if (value.length != 11 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return AppStrings.phoneNumber;
                          }
                          return null;
                        },
                      );
                    }),
                SizedBox(height: 20.h,),


                BlocConsumer<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                      return state.isSubmitting
                          ? const CircularProgressIndicator.adaptive()
                          : CustomButton(
                        onPressed: () {
                          if(EditPhonePro._formKey.currentState!.validate()){
                            BlocProvider.of<EditInfoBloc>(context)
                                .add(EditPhoneSubmitted(
                              phone: _phoneController.text ,

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

              ],),
          ),
        ),
      ),
    );
  }
}
