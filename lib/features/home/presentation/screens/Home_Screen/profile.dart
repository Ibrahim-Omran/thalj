import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-bloc.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-state.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../documents/presentation/components/uploading_supporting_documents/custom_container.dart';
import '../../bloc/paySubscription/paySubscription-event.dart';
import '../../components/profileAppBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final picker = ImagePicker();

  File? billPhoto;

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if(pickedFile!=null){
      setState(() {
        billPhoto = File(pickedFile.path);
      });

    }
    else{
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        const ProfileAppBar(),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "دفع الاشتراكات الشهرية",
                      style: regularStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "قم بدفع الاشتراك الشهري على هذا الحساب",
                  style: regularStyle(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue.withOpacity(.63),
                  ),
                  child: Center(
                      child: Text(
                    '4000 1234 5678 9010',
                    style: regularStyle(),
                  )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<PaySubScriptionBloc, PaySubscriptionState>(
                  listener:
                      (BuildContext context, PaySubscriptionState state) {
                        if (state is PaySubscriptionUploadFailed) {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('تحذير'),
                                content: const Text("يرجى التاكد من رفع كل البانات"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("حسنا"))
                                ],
                              );
                            },
                          );
                        }
                      }, builder: (BuildContext context, PaySubscriptionState state) {


                    return state is PaySubscriptionLoading ? const CircularProgressIndicator.adaptive():Center(
                        child: customContainer(
                            mainText:
                            AppStrings.paidSubscribation,
                            height: 160.h,
                            width: 362.w,
                            textFrontOrBack: '',
                            textFrontOrBack2: '',
                            onTap: () {
                              _getImageFromCamera();






                            }));
                },


                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: (){
                    BlocProvider.of<PaySubScriptionBloc>(context).add(PaySubscriptionUpload(billPhoto: billPhoto!));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        width: double.infinity,
                        height: 40.h,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFF3CC16F),
                        ),
                        child: const Center(
                          child: Text(
                            'ارسل الوصل',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                              height: 0.02,
                              letterSpacing: 1,
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
