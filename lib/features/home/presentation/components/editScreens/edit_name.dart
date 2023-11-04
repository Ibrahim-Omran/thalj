import 'package:flutter/cupertino.dart';
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

class EditNamePro extends StatefulWidget {
  const EditNamePro({super.key});
   static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditNamePro> createState() => _EditNameProState();
}

class _EditNameProState extends State<EditNamePro> {
  final TextEditingController _userNameController = TextEditingController();


  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Form(
        key:EditNamePro._formKey ,
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
                    controller: _userNameController,

                    type: TextInputType.text,
                    maxLines: 1,
                    readonly: false,
                    title: AppStrings.userName,
                    hint: AppStrings.name,
                    vaild: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.vaildForm;
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
                      if(EditNamePro._formKey.currentState!.validate()){
                        BlocProvider.of<EditInfoBloc>(context)
                            .add(EditNameSubmitted(
                          name: _userNameController.text ,

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
