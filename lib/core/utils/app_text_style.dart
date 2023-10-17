import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

TextStyle _textStyle({
  required TextDecoration textDeco,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return GoogleFonts.cairo(
    color: color,
    decoration: textDeco,
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}

// bold style
TextStyle boldStyle({
  Color color = AppColors.black,
  double fontSize = 24,
}) =>
    _textStyle(
      textDeco: TextDecoration.none,
      color: color,
      fontSize: fontSize.sp,
      fontWeight: FontWeight.w700,
    );

// regular style
TextStyle regularStyle({
  Color color = AppColors.black,
  double fontSize = 16,
}) =>
    _textStyle(
      textDeco: TextDecoration.none,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );

//underline style
TextStyle underLineStyle({
  TextDecoration textDeco = TextDecoration.underline,
  Color color = AppColors.primary,
  double fontSize = 16,
}) =>
    _textStyle(
      textDeco: textDeco,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );
