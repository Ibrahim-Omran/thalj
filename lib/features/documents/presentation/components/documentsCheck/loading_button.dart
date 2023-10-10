import 'package:flutter/material.dart';
import 'package:thalj/core/utils/app_colors.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
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
    return Opacity(
      opacity: 0.5,
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: MaterialStateProperty.all(
                background ?? AppColors.primary,
              ),
            ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Icon(Icons.restart_alt),
          Text(
            text,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.white,
                  fontSize: 16,
                ),
          ),
          const Icon(Icons.arrow_forward),
        ]),
      ),
    );
  }
}
