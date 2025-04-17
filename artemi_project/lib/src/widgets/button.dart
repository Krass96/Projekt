import 'package:artemi_project/src/theme/my_color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Alignment alignment;
  final VoidCallback? onPressed;

  const Button({
    required this.text,
    this.icon,
    this.alignment = Alignment.bottomCenter,
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: primColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      icon,
                      size: 25,
                      color: Colors.black,
                    ),
                  ],
                )
              : Text(
                  text,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
