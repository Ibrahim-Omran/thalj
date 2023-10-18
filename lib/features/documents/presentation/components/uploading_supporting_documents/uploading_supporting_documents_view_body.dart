import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/functions/pick_images.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/widgets/logo.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/back_arrow.dart';
import 'custom_container.dart';

class UploadingSupportingDocumentsViewBody extends StatelessWidget {
  const UploadingSupportingDocumentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? proofOfIdentityFront;
    String? proofOfIdentityBack;
    String? residenceCardFront;
    String? residenceCardBack;
    String? drivingLicense;
    String? vehicleLicense;
    String? operatingCard;
    String? transferDocument;
    return BlocConsumer<DocumentCheckingBloc, DocumentCheckingState>(
      listener: (context, state) {
        if (state is DocumentUploadFailed) {
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
      },
      builder: (context, state) {
        return state is DocumentUploading
            ? const CircularProgressIndicator.adaptive()
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: SafeArea(
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
                        Text(AppStrings.uploadingSupportingDocuments,
                            style: boldStyle()),
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
                                textFrontOrBack2: AppStrings.frontId2,
                                onTap: () async {
                                  proofOfIdentityBack =
                                      await pickImageFromGallery();
                                }),
                            SizedBox(
                              width: 10.w,
                            ),
                            customContainer(
                                mainText: AppStrings.frontId,
                                textFrontOrBack: AppStrings.front,
                                height: 160.0.h,
                                width: 176.0.w,
                                textFrontOrBack2: AppStrings.frontId2,
                                onTap: () async {
                                  proofOfIdentityFront =
                                      await pickImageFromGallery();
                                }),
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
                                textFrontOrBack: AppStrings.back,
                                height: 160.0.h,
                                width: 176.0.w,
                                textFrontOrBack2: AppStrings.frontId2,
                                onTap: () async {
                                  residenceCardBack =
                                      await pickImageFromGallery();
                                }),
                            SizedBox(
                              width: 10.w,
                            ),
                            customContainer(
                                mainText: AppStrings.frontId,
                                textFrontOrBack: AppStrings.front,
                                height: 160.0.h,
                                width: 176.0.w,
                                textFrontOrBack2: AppStrings.frontId2,
                                onTap: () async {
                                  residenceCardFront =
                                      await pickImageFromGallery();
                                }),
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
                                mainText:
                                    AppStrings.chooseFileToUploadYourLicense,
                                height: 160.h,
                                width: 362.w,
                                textFrontOrBack: '',
                                textFrontOrBack2: '',
                                onTap: () async {
                                  drivingLicense = await pickImageFromGallery();
                                })),
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
                                mainText:
                                    AppStrings.chooseFileToUploadYourLicense,
                                height: 160.h,
                                width: 362.w,
                                textFrontOrBack: '',
                                textFrontOrBack2: '',
                                onTap: () async {
                                  vehicleLicense = await pickImageFromGallery();
                                })),
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
                                mainText:
                                    AppStrings.chooseFileToUploadYourLicense,
                                height: 160.h,
                                width: 362.w,
                                textFrontOrBack: '',
                                textFrontOrBack2: '',
                                onTap: () async {
                                  operatingCard = await pickImageFromGallery();
                                })),
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
                                mainText:
                                    AppStrings.chooseFileToUploadYourLicense,
                                height: 160.h,
                                width: 362.w,
                                textFrontOrBack: '',
                                textFrontOrBack2: '',
                                onTap: () async {
                                  transferDocument = await pickImageFromGallery();
                                })),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<DocumentCheckingBloc>(context).add(
                                  DocumentUpload(
                                      proofOfIdentityFront:
                                          proofOfIdentityFront ?? '',
                                      proofOfIdentityBack:
                                          proofOfIdentityBack ?? '',
                                      residenceCardFront:
                                          residenceCardFront ?? '',
                                      residenceCardBack: residenceCardBack ?? '',
                                      drivingLicense: drivingLicense ?? '',
                                      vehicleLicense: vehicleLicense ?? '',
                                      operatingCard: operatingCard ?? '',
                                      transferDocument: transferDocument ?? ''));
                              if (state is DocumentUploading) {
                                navigatePushReplacement(
                                    context: context,
                                    route: Routes.documentsCheckScreen);
                              }
                            },
                            child: Container(
                              width: 351.w,
                              height: 47.h,
                              color: AppColors.primary,
                              child: Center(
                                child: Text(
                                  AppStrings.saveData,
                                  style: boldStyle().copyWith(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
