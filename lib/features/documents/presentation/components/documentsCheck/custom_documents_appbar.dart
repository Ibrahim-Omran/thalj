import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/features/auth/presentation/components/back_arrow.dart';


class CustomAppBarDocumentsCheck extends StatelessWidget {
  const CustomAppBarDocumentsCheck({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        SizedBox(
          width: 8.h,
        ),
        Text(
          title,
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
        ),
        const Spacer(),
        const BackArrow(),
      ],
    );
  }
}
