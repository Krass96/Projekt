import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Logo_frame.png',
      width: 200,
      fit: BoxFit.cover,
    );
  }
}
