import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const logoWidth = 150.0;
    const logoHeight = 150.0;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final widthFactor = logoWidth / screenWidth;
    final heightFactor = logoHeight / screenHeight;

    return SizedBox(
        width: screenWidth * widthFactor,
        height: screenHeight * heightFactor,
        child: Image.asset(
          AppAssets.appLogo,
          fit: BoxFit.contain,
        ));
  }
}
