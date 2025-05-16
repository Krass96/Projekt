import 'package:flutter/material.dart';

class MyBgColor extends StatelessWidget {
  final BorderRadius? borderRadius;

  const MyBgColor({
    super.key,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myGradientBg(),
    );
  }

  BoxDecoration myGradientBg({BorderRadius? borderRadius}) {
    return BoxDecoration(
      borderRadius: borderRadius,
      gradient: const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.center,
        colors: [
          Color(0xFF666666),
          Color(0xFF000000),
        ],
      ),
    );
  }
}
