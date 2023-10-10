import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/done_loading_button.dart';
import 'package:thalj/features/documents/presentation/components/documentsCheck/loading_button.dart';

class CustomButtonDelivery extends StatelessWidget {
  const CustomButtonDelivery({
    super.key,
    this.height = 48,
    this.width = double.infinity,
    required this.onPressed,
    this.background,
    required this.text,
    this.loading = false,
  });

  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height!.h,
        width: width!.w,
        child: loading
            ? LoadingButton(
                onPressed: onPressed, background: background, text: text)
            : DoneLoadingButton(
                onPressed: onPressed, background: background, text: text));
  }
}
