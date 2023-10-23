
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/routes/app_routes.dart';
import 'package:thalj/core/utils/app_colors.dart';
import 'package:thalj/core/utils/app_strings.dart';
import 'package:thalj/core/utils/commons.dart';

import '../../../domain/repository.dart';
import '../../bloc/driver_subscription_bloc/driver_subscription_bloc.dart';
import '../../bloc/user_invoice_bloc/user_invoice_bloc.dart';
import '../../screens/driver_subscription_screen.dart';
import '../../screens/user_subscription_screen.dart';

class AdminOptionsBody extends StatelessWidget {
  const AdminOptionsBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              navigatePushNamed(context: context, route: Routes.driverDoc);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.driverDocuments,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => BlocProvider(
                  create: (context) => UserInvoiceBloc(
                      adminRepository: context.read<AdminRepository>()),child: const UserSubscriptionScreen()),
              ),
              );



                  },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.customersBills,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {



              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                      create: (context) => DriverSubscriptionBloc(
                          adminRepository: context.read<AdminRepository>()),child: const DriverSubscriptionScreen()),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.driversBills,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
