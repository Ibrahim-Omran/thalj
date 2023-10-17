import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/widgets/logo.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/back_arrow.dart';
import 'custom_container.dart';

class UploadingSupportingDocumentsViewBody extends StatelessWidget {
  const UploadingSupportingDocumentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackArrow(),
              ],
            ),
            const Center(
              child: LogoWidget(),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(AppStrings.uploadingSupportingDocuments, style: boldStyle()),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.uploadingId,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customContainer(
                    mainText: AppStrings.frontId,
                    textFrontOrBack: AppStrings.back,
                    height: 160.0.h,
                    width: 176.0.w,
                    textFrontOrBack2: AppStrings.frontId2),
                SizedBox(
                  width: 10.w,
                ),
                customContainer(
                    mainText: AppStrings.frontId,
                    textFrontOrBack: AppStrings.front,
                    height: 160.0.h,
                    width: 176.0.w,
                    textFrontOrBack2: AppStrings.frontId2),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.expatriateUploadingId,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customContainer(
                    mainText: AppStrings.frontId,
                    textFrontOrBack:  AppStrings.back,
                    height: 160.0.h,
                    width: 176.0.w,
                    textFrontOrBack2: AppStrings.frontId2),
                SizedBox(
                  width: 10.w,
                ),
                customContainer(
                    mainText: AppStrings.frontId,
                    textFrontOrBack:  AppStrings.front,
                    height: 160.0.h,
                    width: 176.0.w,
                    textFrontOrBack2: AppStrings.frontId2),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.uploadDrivingLicense,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: customContainer(
                    mainText: AppStrings.chooseFileToUploadYourLicense,
                    height: 160.h,
                    width: 362.w,
                    textFrontOrBack: '',
                    textFrontOrBack2: '')),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.uploadVehicleRegistrationForm,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: customContainer(
                    mainText: AppStrings.chooseFileToUploadYourLicense,
                    height: 160.h,
                    width: 362.w,
                    textFrontOrBack: '',
                    textFrontOrBack2: '')),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.uploadDriverCard,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: customContainer(
                    mainText: AppStrings.chooseFileToUploadYourLicense,
                    height: 160.h,
                    width: 362.w,
                    textFrontOrBack: '',
                    textFrontOrBack2: '')),
            SizedBox(
              height: 12.h,
            ),
            Text(
              AppStrings.uploadTransferDocument,
              style: regularStyle(),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: customContainer(
                    mainText: AppStrings.chooseFileToUploadYourLicense,
                    height: 160.h,
                    width: 362.w,
                    textFrontOrBack: '',
                    textFrontOrBack2: '')),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  navigatePushReplacement(
                      context: context, route: Routes.documentsCheckScreen);
                },
                child: Container(
                  width: 351.w,
                  height: 47.h,
                  color: AppColors.primary,
                  child: Center(
                    child: Text(
                      AppStrings.saveData,
                      style: boldStyle()
                          .copyWith(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
