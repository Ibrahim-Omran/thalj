import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';

class CustomSenderAndRecipientInfo extends StatelessWidget {
  const CustomSenderAndRecipientInfo({
    super.key,
    required this.senderOrRecipientInfo,
    required this.region,
    required this.addressDetails,
    required this.buildingNumber,
    required this.floorNumber,
    required this.apartmentNumber,
    required this.specialMarque,
    required this.phoneNumberInfo,
  });

  final String senderOrRecipientInfo;

  final String region;

  final String addressDetails;

  final String buildingNumber;

  final String floorNumber;

  final String apartmentNumber;

  final String specialMarque;

  final String phoneNumberInfo;

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
            senderOrRecipientInfo,
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
            '${AppStrings.region} $region',
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
            '${AppStrings.addressDetails} $addressDetails',
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
                  '${AppStrings.buildingNumber} $buildingNumber',
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
                  '${AppStrings.floorNumber} $floorNumber',
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
                  '${AppStrings.apartmentNumber} $apartmentNumber',
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
          SizedBox(
            height: 10.h,
          ),
          Text(
            '${AppStrings.phoneNumberInfo} $phoneNumberInfo',
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
