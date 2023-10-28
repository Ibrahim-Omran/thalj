import 'package:flutter/material.dart';

class Colours{

  const Colours._();

  // gradients
  static const Gradient appBarGradient = LinearGradient(
    colors: [Color(0xFF155293), Color(0xFF1F6EC3), Color(0xFF155293)], // Define your gradient colors
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  // colors
  static const primaryColour = Color(0xFF155293);
  static const secondaryColour = Color(0xFFF0F3FD);
  static const accentColour = Color(0xFFE0E8FF);


  // text colors
  static const txtMainColor = Color(0xFF212121);
  static const txtDetailedColor = Color(0xFF4A4A4A);


}