import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class CustomShippingInfo extends StatelessWidget {
  const CustomShippingInfo({
    super.key,
    required this.shippingDescription,
    required this.shippingType,
    required this.weight,
    required this.temp,
    required this.humidity,
    required this.specialMarque,
  });
  final String shippingDescription;
  final String shippingType;
  final String weight;
  final String temp;
  final String humidity;
  final String specialMarque;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.shippingInformation,
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            '${AppStrings.shippingDescription} $shippingDescription',
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${AppStrings.shippingType} $shippingType',
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14),
          ),
          SizedBox(
            height: 10.h,
          ),
          FittedBox(
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '${AppStrings.weight} $weight',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14),
                ),
                SizedBox(
                  width: 35.5.w,
                ),
                Text(
                  '${AppStrings.temp} $temp',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14),
                ),
                SizedBox(
                  width: 35.5.w,
                ),
                Text(
                  '${AppStrings.humidity} $humidity',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${AppStrings.specialMarque} $specialMarque',
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
