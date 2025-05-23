import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Alignment alignment;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color backgroundColor;
  final Color foregroundColor;

  const MyButton({
    this.text,
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
            disabledBackgroundColor: const Color.fromARGB(255, 49, 49, 48),
            disabledForegroundColor: const Color.fromARGB(255, 151, 150, 150),
          ),
          child: icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      text ?? '',
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      icon,
                      size: 32,
                      color: Colors.black,
                    ),
                  ],
                )
              : Text(
                  text ?? '',
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
