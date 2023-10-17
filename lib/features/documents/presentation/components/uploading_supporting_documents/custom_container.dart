import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/core/utils/app_assets.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_style.dart';

Widget customContainer(
    {required String textFrontOrBack,
    required String textFrontOrBack2,
    required String mainText,
    required double height,
    required double width,
    required void Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightBlue.withOpacity(.63),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.0.h, bottom: 18.0.h),
            child: Image.asset(
              AppAssets.upload,
              height: 28.h,
              width: 28.w,
            ),
          ),
          Text(mainText, style: regularStyle()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text(textFrontOrBack,
                  style: boldStyle().copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                  )),
              Text(
                textFrontOrBack2,
                style: regularStyle(),
              ),
            ],
          ),
          Text(AppStrings.jpgOnly,
              style: regularStyle().copyWith(
                fontSize: 10,
              )),
        ],
      ),
    ),
  );
}
