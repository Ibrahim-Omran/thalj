import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

Widget buildOffersITem({required String name}) {
  return Container(
    height: 150.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.lightBlue.withOpacity(.63),
    ),
    child: Column(
      children: [
        Text(
          "لقد وافق منتج $name على طلبك وسيتواصل معك قريبا",
          style: boldStyle(),
          textAlign: TextAlign.center,
        ),
        Container(
            width: 150.w,
            height: 40.h,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF3CC16F),
            ),
            child: const Center(
              child: Text(
                'تم الدفع',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  height: 0.02,
                  letterSpacing: 1,
                ),
              ),
            )
        ),

      ],
    ),
  );
}