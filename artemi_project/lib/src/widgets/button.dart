import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Alignment alignment;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color backgroundColor;
  final Color foregroundColor;

  const Button({
    required this.text,
    this.icon,
    this.alignment = Alignment.bottomCenter,
    this.width,
    this.height,
    super.key,
    this.onPressed,
    this.fontSize,
    this.backgroundColor = Palette.artGold,
    this.foregroundColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            disabledBackgroundColor: const Color(0xFFC5C4B9),
            disabledForegroundColor: Colors.black,
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      icon,
                      size: 35,
                      color: Colors.black,
                    ),
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
