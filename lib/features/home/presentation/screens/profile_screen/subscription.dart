import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/core/widgets/back_arrow.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-bloc.dart';
import 'package:thalj/features/home/presentation/bloc/paySubscription/paySubscription-state.dart';

import '../../../../../core/local/cash_helper.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/logo.dart';
import '../../../../documents/presentation/components/uploading_supporting_documents/custom_container.dart';
import '../../bloc/paySubscription/paySubscription-event.dart';

class Subscription extends StatefulWidget {

  const Subscription({super.key, });

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  final picker = ImagePicker();
String? status = CacheHelper.getData(key: 'status');
String? subscriptionDate = CacheHelper.getData(key: 'subscriptionDate');
int? daysUntilExpiry = CacheHelper.getData(key: 'daysUntilExpiry');


  File? billPhoto;
  void updateStatusToWaiting() {
    CacheHelper.saveData(key: 'status', value: 'Waiting');
  }
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
    List<String> parts = subscriptionDate!.split('T');
    String datePart = parts[0];


    return Scaffold(
      body: SafeArea(child: _body(context,datePart)),
    );
  }

  Widget _body(BuildContext context,String datePart) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackArrow(),
            ],
          ),
          const Center(child: LogoWidget()),

          SingleChildScrollView(
            child: status == "Accepted"
                ? Column(
              children: [



                Center(
                  child: Column(


                    children: [

                      Text(
                        "الحساب مفعل",
                        style: boldStyle(fontSize: 30.h),
                      ),
                      Text(
                        "متبقي لك $daysUntilExpiry يوم",
                        style: boldStyle(fontSize: 30.h),
                      ),
                      Text(
                        "تارخ الانتهاء  $datePart",
                        style: boldStyle(fontSize: 30.h),
                      ),
                    ],
                  ),
                ),
              ],
            )
                : status  == "Waiting"
                ? Column(
              children: [

                Center(
                  child: Text(
                    "جاري التحقق من الفاتورة",
                    style: boldStyle(fontSize: 24.h),
                  ),
                ),
              ],
            )
                : Column(
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<PaySubScriptionBloc, PaySubscriptionState>(
                  builder: (context, state) {
                    return Column(
                      children: [
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
                        InkWell(
                          onTap: () {
                            if(billPhoto == null) {
                              showToast(
                              text: "برجاء تحميل الفاتورة",
                              state: ToastStates.error,
                            );
                            } else {
                              BlocProvider.of<PaySubScriptionBloc>(context).add(
                                PaySubscriptionUpload(
                                  billPhoto: billPhoto!,

                                ),
                              );
                             // updateStatusToWaiting();
                            }
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
                                    fontSize: 18,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }, listener: (BuildContext context, PaySubscriptionState state) {
                    if(state is PaySubscriptionSuccess)
                      {
                        navigatePushReplacement(context: context, route: Routes.homeScreen);

                      }
                },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}