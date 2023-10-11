import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_colors.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_style.dart';

// ignore: must_be_immutable
class MyFormField extends StatelessWidget {
  final double radius;
  final String title;
  final String hint;
  int? maxLines;
  TextStyle? hintStyle;
  final TextInputType type;
  final VoidCallback? prefixIconPressed;
  final IconData? prefixIcon;
  final Widget? widget;
  TextEditingController? controller;
  bool readonly = false;
  bool isPassword;

  MyFormField({
    Key? key,
    this.isPassword = false,
    this.radius = 15,
    required this.type,
    required this.hint,
    required this.maxLines,
    this.prefixIcon,
    this.prefixIconPressed,
    this.widget,
    this.controller,
    required this.readonly,
    this.hintStyle,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: regularStyle(color: AppColors.primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextFormField(
            textDirection: TextDirection.rtl,
            obscureText: isPassword,
            readOnly: readonly,
            controller: controller,
            keyboardType: type,
            maxLines: maxLines,
            // Allow for dynamic expansion
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: regularStyle(color: Colors.grey),
              hintTextDirection: TextDirection.rtl,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(6),
              ),
              prefixIcon: prefixIcon != null
                  ? IconButton(
                      onPressed: () {
                        prefixIconPressed!();
                      },
                      icon: Icon(
                        prefixIcon,
                        color: Colors.blue,
                      ),
                    )
                  : null,
            ),
            //  validator: vaild,
          ),
        ),
      ],
    );
  }
}

String? vaild(value) {
  if (value.isEmpty) {
    return AppStrings.vaildForm;
  }
  return null;
}
