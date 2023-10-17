import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

driverShowIdentityContainer({
  String? imagePath,
}) {
  return Container(
    height: 267.h,
    width: 515.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.lightBlue.withOpacity(.63),
    ),
    child: Image.network(imagePath!),
  );
}
