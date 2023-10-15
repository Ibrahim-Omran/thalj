import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/commons.dart';

class DriverDocWidget extends StatelessWidget {
  const DriverDocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        navigate(context: context, route: Routes.driverDataSentToOwner);
      },
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(

            "محمد احمد عمر ",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 24),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
