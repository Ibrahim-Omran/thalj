import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(
          AppAssets.backButton,
        ));
  }
}
