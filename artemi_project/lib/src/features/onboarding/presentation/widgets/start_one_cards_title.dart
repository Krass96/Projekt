import 'package:flutter/material.dart';

class StartOneCardsTitle extends StatelessWidget {
  const StartOneCardsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 202.0,
      height: 32.83,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFFFEE32),
          fontSize: 23.45,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 1.33,
          letterSpacing: -0.36,
        ),
      ),
    );
  }
}
