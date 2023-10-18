import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/features/home/domain/models/drivers_model.dart';
import 'package:thalj/features/home/presentation/bloc/accept_drivers_bloc/accept_drivers_bloc.dart';
import 'package:thalj/features/home/presentation/bloc/drivers_data_bloc/get_drivers_data_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../../domain/repository.dart';
import '../components/driver_data_sent_to_owner/driver_show_identity_counainer.dart';

class DriverDataSentToOwner extends StatelessWidget {
  const DriverDataSentToOwner({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DriversModel;
    print(args);
    return Scaffold(
      body: BlocProvider(
        create: (context) => AcceptDriversBloc(
            driverRepository: context.read<DriverRepository>()),
        child: BlocConsumer<AcceptDriversBloc, AcceptDriversState>(
          listener: (context, state) {
            if (state is AcceptDriversSuccess) {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('احسنت'),
                    content: Text("تم قبول السائق${args.fullname}"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            BlocProvider.of<GetDriversDataBloc>(context)
                                .add(GetDriversData());
                          },
                          child: const Text("حسنا"))
                    ],
                  );
                },
              );
            } else if (state is AcceptDriversFailure) {
              showAdaptiveDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('خطأ'),
                    content: Text("لم يتم قبول السائق${args.fullname}"),
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
            return state is AcceptDriversLoading
                ? const Center(
                    child: CircularProgressIndicator(),
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
                            Text(AppStrings.identityProof, style: regularStyle()),
                            Text(": ${AppStrings.front}", style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.proofOfIdentityFront,
                            ),
                            Text(": ${AppStrings.back}", style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.proofOfIdentityBack,
                            ),
                            Text(AppStrings.residenceCard, style: regularStyle()),
                            Text(": ${AppStrings.front}", style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.residenceCardFront,
                            ),
                            Text(": ${AppStrings.back}", style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.residenceCardBack,
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
                            Text(AppStrings.operatingCard, style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.operatingCard,
                            ),
                            Text(AppStrings.transferDocument,
                                style: regularStyle()),
                            driverShowIdentityContainer(
                              imagePath: args.transferDocument,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AcceptDriversBloc>(context)
                                      .add(AcceptDrivers(driverId: args.id!));
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
                                  // You can customize other properties like textStyle, elevation, and more here
                                ),
                                onPressed: () {},
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
