import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Alignment alignment;

  const Button({
    required this.text,
    this.icon,
    this.alignment = Alignment.bottomCenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFEE32),
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
                      size: 20,
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
