import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:thalj/core/utils/app_text_style.dart';

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
    child: CachedNetworkImage(
      imageUrl: imagePath!,
      placeholder: (context, url) {
        return Shimmer.fromColors(
            baseColor: AppColors.primary,
            highlightColor: AppColors.lightBlue,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),

        );
      },
      errorWidget: (context, url, error) {
        return  Center(child: Text("لا يوجد ملف",style: boldStyle(fontSize: 20),));
      },
    ),
  );
}