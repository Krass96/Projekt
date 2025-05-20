import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width;

  const LogoWidget({super.key, required this.width});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets//logo/logo.png',
      width: width,
      fit: BoxFit.cover,
    );
  }
}
