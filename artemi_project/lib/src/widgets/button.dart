import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Alignment alignment;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final TextStyle? fontSize;

  const Button({
    required this.text,
    this.icon,
    this.alignment = Alignment.bottomCenter,
    this.width,
    this.height,
    super.key,
    this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
        child: SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.artGold,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
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
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
