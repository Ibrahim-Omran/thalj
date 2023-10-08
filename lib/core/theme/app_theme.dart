import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.white,

    //appBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),

    //text theme
    textTheme: TextTheme(
      displayLarge: boldStyle(),
      displayMedium: regularStyle(),
    ),

    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
    ),

    // text field
    inputDecorationTheme: InputDecorationTheme(
      //enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightBlue,
        ),
      ),

      //focused Border
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightBlue,
        ),
      ),

      //hint text
      hintStyle: boldStyle(color: AppColors.lightBlue, fontSize: 16),

      // filled: true,
      // fillColor: AppColors.backGroundTextField,
    ),
  );
}
