import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

abstract class Styles{
  static const textStyle12=TextStyle(
      fontSize: 12 , fontWeight: FontWeight.w500 , color: Colours.txtDetailedColor,
      fontFamily: Fonts.cairo
  );
  static const textStyle14=TextStyle(
      fontSize: 14 , fontWeight: FontWeight.w400 , color: Colours.txtMainColor,
      fontFamily: Fonts.cairo
  );
  static var textStyle14blue=TextStyle(
      fontSize: 14 , fontWeight: FontWeight.w400 , color: Colours.primaryColour.withOpacity(0.5),
      fontFamily: Fonts.cairo
  );
  static const textStyle16=TextStyle(
      fontSize: 16 , fontWeight: FontWeight.w600, color: Colours.txtMainColor,
      fontFamily: Fonts.cairo
  );

  static const textStyle18=TextStyle(
      fontSize: 18 , fontWeight: FontWeight.w600 , color: Colours.txtMainColor,
      fontFamily: Fonts.cairo
  );
  static const textStyle18Primary=TextStyle(
      fontSize: 18 , fontWeight: FontWeight.w500 , color: Colours.primaryColour,
      fontFamily: Fonts.cairo
  );
  static const textStyle16Detailed=TextStyle(
      fontSize: 16 , fontWeight: FontWeight.w500, color: Colours.txtDetailedColor,
      fontFamily: Fonts.cairo
  );


  static const textStyle24=TextStyle(
      fontSize: 24 , fontWeight: FontWeight.w700 ,
      fontFamily: Fonts.cairo
  );
  static const textStyle40=TextStyle(
      fontSize: 35 , fontWeight: FontWeight.w700 ,
      fontFamily: Fonts.cairo
  );
  static const textStyle10=TextStyle(
      fontSize: 10 , fontWeight: FontWeight.w500 ,
      fontFamily: Fonts.cairo
  );
  static const textFieldLabel=TextStyle(
      fontSize:18 , fontWeight: FontWeight.w500 , color: Colours.primaryColour,
      fontFamily: Fonts.cairo
  );
  static const textStyle20Head=TextStyle(
      fontSize:20 , fontWeight: FontWeight.w700 ,
      fontFamily: Fonts.cairo
  );
  static const textStyle20Body=TextStyle(
      fontSize:20 , fontWeight: FontWeight.w500 ,
      fontFamily: Fonts.cairo
  );
}