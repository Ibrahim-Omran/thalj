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

class EditEmailPro extends StatefulWidget {
  const EditEmailPro({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<EditEmailPro> createState() => _EditEmailProState();
}

class _EditEmailProState extends State<EditEmailPro> {
  final TextEditingController _emailController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Form(
          key:EditEmailPro._formKey ,
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
                        controller: _emailController,

                        type: TextInputType.text,
                        maxLines: 1,
                        readonly: false,
                        title: AppStrings.editEmail,
                        hint: AppStrings.email,
                        vaild: (value) {
    if (value!.isEmpty) {
    return AppStrings.vaildForm;
    }
    if (!value.contains("@")) {
    return AppStrings.vailEmailForm;
    }
    return null;}
                      );
                    }),
                SizedBox(height: 20.h,),


                BlocConsumer<EditInfoBloc, EditInfoState>(
                    builder: (context, state) {
                      return state.isSubmitting
                          ? const CircularProgressIndicator.adaptive()
                          : CustomButton(
                        onPressed: () {
                          if(EditEmailPro._formKey.currentState!.validate()){
                            BlocProvider.of<EditInfoBloc>(context)
                                .add(EditEmailSubmitted(
                              email: _emailController.text ,

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
