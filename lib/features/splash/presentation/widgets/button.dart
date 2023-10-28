import 'package:flutter/material.dart';
class MyButton extends StatelessWidget{
  const MyButton({super.key,
    required this.onPressed,
    required this.buttonColor, required this.child, this.border,

  });
  final Widget child;
  final Color buttonColor;
  final VoidCallback onPressed;
  final border;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: buttonColor,
        border:border??Border.all(width: 0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: MaterialButton(
          onPressed: onPressed,
          minWidth: 343,
          height:  48,
          child: child),

    );

  }

}