import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double widht;

  const LogoWidget({super.key, required this.widht});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets//logo/logo.png',
      width: widht,
      fit: BoxFit.cover,
    );
  }
}
