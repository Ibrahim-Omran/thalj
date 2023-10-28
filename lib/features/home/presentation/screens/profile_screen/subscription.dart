import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thalj/core/widgets/back_arrow.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/toast.dart';
import '../../../../documents/presentation/components/uploading_supporting_documents/custom_container.dart';
import '../../bloc/paySubscription/paySubscription-bloc.dart';
import '../../bloc/paySubscription/paySubscription-event.dart';
import '../../bloc/paySubscription/paySubscription-state.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final picker = ImagePicker();

//String ? status = SaveDataManager.loginModel!.status;
  File? billPhoto;

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        billPhoto = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  BackArrow(),
                ],
              ),
              SizedBox(height: 150.h,),
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
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              customContainer(
                mainText: billPhoto == null
                    ? AppStrings.paidSubscribation
                    : AppStrings.donePay,
                height: 160.h,
                width: 362.w,
                textFrontOrBack: '',
                textFrontOrBack2: '',
                onTap: () {
                  _getImageFromCamera();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<PaySubScriptionBloc, PaySubscriptionState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        billPhoto == null
                            ? showToast(
                          text: "برجاء تحميل الفاتورة",
                          state: ToastStates.error,
                        )
                            : BlocProvider.of<PaySubScriptionBloc>(context).add(
                          PaySubscriptionUpload(
                            billPhoto: billPhoto!,
                          ),
                        );
                      },
                      child: state is PaySubscriptionUploading
                          ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                          : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.h,
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: billPhoto == null
                                ? Colors.grey
                                : const Color(0xFF3CC16F),
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
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }


}
