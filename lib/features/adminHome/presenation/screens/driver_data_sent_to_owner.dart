import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/features/adminHome/domain/models/drivers_model.dart';
import 'package:thalj/features/adminHome/domain/repository.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../bloc/accept_refuse_drivers_bloc/accept_refuse_drivers_bloc.dart';
import '../components/driver_data_sent_to_owner/driver_show_identity_counainer.dart';

class DriverDataSentToOwner extends StatelessWidget {
  const DriverDataSentToOwner({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DriversModel;
    return Scaffold(
      body: BlocProvider(
        create: (context) => AcceptRefuseDriversBloc(
            adminRepository: context.read<AdminRepository>(),),
        child: BlocBuilder<AcceptRefuseDriversBloc, AcceptRefuseDriversState>(
          builder: (context, state) {
            return state is AcceptRefuseDriversLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
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
                            Text(args.fullname!, style: boldStyle()),
                            Text(AppStrings.identityProof,
                                style: regularStyle()),
                            Text(": ${AppStrings.front}",
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.proofOfIdentityFront,
                            ),
                            Text(": ${AppStrings.back}", style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.proofOfIdentityBack,
                            ),


                            Text(AppStrings.drivingLicense,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.drivingLicense,
                            ),
                            Text(AppStrings.vehicleRegistration,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.vehicleLicense,
                            ),
                            Text(AppStrings.operatingCard,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.operatingCard,
                            ),
                            Text(AppStrings.transferDocument,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.transferDocument,
                            ),
                            Text(AppStrings.taxDocument,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.commercialRegister,
                            ),
                            SizedBox(height: 15.h,),
                            ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AcceptRefuseDriversBloc>(
                                          context)
                                      .add(AcceptDrivers(driverId: args.id!));
                                  navigatePushReplacement(
                                      context: context, route: Routes.driverDoc);
                                },
                                child: Container(
                                  width: 351.w,
                                  height: 47.h,
                                  color: AppColors.primary,
                                  child: Center(
                                    child: Text(
                                      AppStrings.requestAccept,
                                      style: boldStyle().copyWith(
                                          color: Colors.white, fontSize: 16.0),
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(AppColors
                                          .darkRed), // Set the background color to blue
                                ),
                                onPressed: () {
                                  BlocProvider.of<AcceptRefuseDriversBloc>(
                                          context)
                                      .add(RefuseDrivers(driverId: args.id!));
                                  navigatePushReplacement(
                                      context: context, route: Routes.driverDoc);
                                },
                                child: SizedBox(
                                  width: 351.w,
                                  height: 47.h,
                                  child: Center(
                                    child: Text(
                                      AppStrings.requestReject,
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
        ),
      ),
    );
  }
}
