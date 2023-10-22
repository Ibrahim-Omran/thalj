import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/commons.dart';
import 'package:thalj/core/utils/toast.dart';
import 'package:thalj/core/widgets/logo.dart';
import 'package:thalj/features/documents/presentation/bloc/document_checking_bloc/document_checking_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/back_arrow.dart';
import 'custom_container.dart';

class UploadingSupportingDocumentsViewBody extends StatefulWidget {
  const UploadingSupportingDocumentsViewBody({super.key});

  @override
  State<UploadingSupportingDocumentsViewBody> createState() =>
      _UploadingSupportingDocumentsViewBodyState();
}

class _UploadingSupportingDocumentsViewBodyState
    extends State<UploadingSupportingDocumentsViewBody> {
  // File? _image;
  final picker = ImagePicker();

  XFile? proofOfIdentityFront;
  XFile? proofOfIdentityBack;
  XFile? residenceCardFront;
  XFile? residenceCardBack;
  XFile? drivingLicense;
  XFile? vehicleLicense;
  XFile? operatingCard;
  XFile? transferDocument;
  Future<void> _getImageFromCamera(String variableName) async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    setState(() {
      switch (variableName) {
        case 'proofOfIdentityFront':
          if (pickedFile!.path.isNotEmpty) {
            proofOfIdentityFront = pickedFile;
            print('data= $proofOfIdentityFront');
          }
          break;
        case 'proofOfIdentityBack':
          if (pickedFile!.path.isNotEmpty) {
            proofOfIdentityBack = pickedFile;
            print('data= $proofOfIdentityBack');
          }
          break;
        case 'residenceCardFront':
          if (pickedFile!.path.isNotEmpty) {
            residenceCardFront = pickedFile;
            print('data= $residenceCardFront');
          }
          break;
        case 'residenceCardBack':
          if (pickedFile!.path.isNotEmpty) {
            residenceCardBack = pickedFile;
            print('data= $residenceCardBack');
          }
          break;
        case 'drivingLicense':
          if (pickedFile!.path.isNotEmpty) {
            drivingLicense = pickedFile;
            print('data= $drivingLicense');
          }
          break;
        case 'vehicleLicense':
          if (pickedFile!.path.isNotEmpty) {
            vehicleLicense = pickedFile;
            print('data= $vehicleLicense');
          }
          break;
        case 'operatingCard':
          if (pickedFile!.path.isNotEmpty) {
            operatingCard = pickedFile;
            print('data= $operatingCard');
          }
          break;
        case 'transferDocument':
          if (pickedFile!.path.isNotEmpty) {
            transferDocument = pickedFile;
            print('data= $transferDocument');
          }
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DocumentCheckingBloc, DocumentCheckingState>(
      listener: (context, state) {
        if (state is DocumentUploadFailed) {
          showToast(
            text: "يوجد مشكلة في السيرفر يرجى التاكد من رفع البيانات",
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        return state is DocumentUploading
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'جاري تحميل البيانات',
                      style: boldStyle(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const CircularProgressIndicator.adaptive(),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                            proofOfIdentityBack == null
                                ? customContainer(
                                    mainText: AppStrings.frontId,
                                    textFrontOrBack: AppStrings.back,
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: AppStrings.frontId2,
                                    onTap: () {
                                      _getImageFromCamera(
                                          'proofOfIdentityBack');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  ),
                            SizedBox(
                              width: 10.w,
                            ),
                            proofOfIdentityFront == null
                                ? customContainer(
                                    mainText: AppStrings.frontId,
                                    textFrontOrBack: AppStrings.front,
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: AppStrings.frontId2,
                                    onTap: () {
                                      _getImageFromCamera(
                                          'proofOfIdentityFront');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  ),
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
                            residenceCardBack == null
                                ? customContainer(
                                    mainText: AppStrings.frontId,
                                    textFrontOrBack: AppStrings.back,
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: AppStrings.frontId2,
                                    onTap: () {
                                      _getImageFromCamera('residenceCardBack');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  ),
                            SizedBox(
                              width: 10.w,
                            ),
                            residenceCardFront == null
                                ? customContainer(
                                    mainText: AppStrings.frontId,
                                    textFrontOrBack: AppStrings.front,
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: AppStrings.frontId2,
                                    onTap: () {
                                      _getImageFromCamera('residenceCardFront');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  ),
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
                            child: drivingLicense == null
                                ? customContainer(
                                    mainText: AppStrings
                                        .chooseFileToUploadYourLicense,
                                    height: 160.h,
                                    width: 362.w,
                                    textFrontOrBack: '',
                                    textFrontOrBack2: '',
                                    onTap: () {
                                      _getImageFromCamera('drivingLicense');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  )),
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
                            child: vehicleLicense == null
                                ? customContainer(
                                    mainText: AppStrings
                                        .chooseFileToUploadYourLicense,
                                    height: 160.h,
                                    width: 362.w,
                                    textFrontOrBack: '',
                                    textFrontOrBack2: '',
                                    onTap: () {
                                      _getImageFromCamera('vehicleLicense');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  )),
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
                            child: operatingCard == null
                                ? customContainer(
                                    mainText: AppStrings
                                        .chooseFileToUploadYourLicense,
                                    height: 160.h,
                                    width: 362.w,
                                    textFrontOrBack: '',
                                    textFrontOrBack2: '',
                                    onTap: () {
                                      _getImageFromCamera('operatingCard');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  )),
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
                            child: transferDocument == null
                                ? customContainer(
                                    mainText: AppStrings
                                        .chooseFileToUploadYourLicense,
                                    height: 160.h,
                                    width: 362.w,
                                    textFrontOrBack: '',
                                    textFrontOrBack2: '',
                                    onTap: () {
                                      _getImageFromCamera('transferDocument');
                                    })
                                : customContainer(
                                    mainText: AppStrings.doneUploading,
                                    textFrontOrBack: '',
                                    height: 160.0.h,
                                    width: 176.0.w,
                                    textFrontOrBack2: '',
                                    onTap: () {},
                                  )),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<DocumentCheckingBloc>(context)
                                  .add(DocumentUpload(
                                proofOfIdentityFront: proofOfIdentityFront!,
                                proofOfIdentityBack: proofOfIdentityBack!,
                                residenceCardFront: residenceCardFront!,
                                residenceCardBack: residenceCardBack!,
                                drivingLicense: drivingLicense!,
                                vehicleLicense: vehicleLicense!,
                                operatingCard: operatingCard!,
                                transferDocument: transferDocument!,
                              ));
                              if (state is DocumentCheckingLoading) {
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
