import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/back_button.dart';

class CustomAppBarProductInfo extends StatelessWidget {
  const CustomAppBarProductInfo({
    super.key,
    required this.url,
    required this.title,
    required this.onTap,
  });

  final String url;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        SvgPicture.asset(
          url,
          height: 21.93.h,
          width: 19.5.w,
        ),
        SizedBox(
          width: 8.h,
        ),
        Text(
          title,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18),
        ),
        const Spacer(),
        CustomBackButton(onTap: onTap)
      ],
    );
  }
}
