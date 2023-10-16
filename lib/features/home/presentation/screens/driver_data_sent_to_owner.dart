import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_assets.dart';
import 'package:thalj/core/utils/app_strings.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../components/driver_data_sent_to_owner/driver_show_identity_counainer.dart';

class DriverDataSentToOwner extends StatelessWidget {
  const DriverDataSentToOwner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                Text("محمد احمد عمر  ", style: boldStyle()),
                Text(AppStrings.identityProof, style: regularStyle()),
                Text(": ${AppStrings.front}", style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(": ${AppStrings.back}", style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(AppStrings.residenceCard, style: regularStyle()),
                Text(": ${AppStrings.front}", style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(": ${AppStrings.back}", style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(AppStrings.drivingLicense, style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(AppStrings.vehicleRegistration, style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(AppStrings.operatingCard, style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                Text(AppStrings.transferDocument, style: regularStyle()),
                driverShowIdentityContainer(imagePath: AppAssets.identity,),
                ElevatedButton(
                    onPressed: () {
                      navigate(
                          context: context, route: Routes.documentsCheckScreen);
                    },
                    child: Container(
                      width: 351.w,
                      height: 47.h,
                      color: AppColors.primary,
                      child: Center(
                        child: Text(
                          AppStrings.requestAccept,
                          style: boldStyle()
                              .copyWith(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(AppColors.darkRed), // Set the background color to blue
                      // You can customize other properties like textStyle, elevation, and more here
                    ),
                    onPressed: () {
                      navigate(
                          context: context, route: Routes.documentsCheckScreen);
                    },
                    child: SizedBox(
                      width: 351.w,
                      height: 47.h,
                      child: Center(
                        child: Text(
                          AppStrings.requestReject,
                          style: boldStyle()
                              .copyWith(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    )),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
