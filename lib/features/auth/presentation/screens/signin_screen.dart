import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_strings.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(
          AppStrings.appName,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
