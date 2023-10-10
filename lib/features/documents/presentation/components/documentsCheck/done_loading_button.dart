import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_colors.dart';

class DoneLoadingButton extends StatelessWidget {
  const DoneLoadingButton({
    super.key,
    required this.onPressed,
    required this.background,
    required this.text,
  });

  final VoidCallback onPressed;
  final Color? background;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(
              background ?? AppColors.primary,
            ),
          ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Spacer(),
        Text(
          text,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.white,
                fontSize: 16,
              ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward),
      ]),
    );
  }
}
