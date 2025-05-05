import 'package:flutter/material.dart';

class MyBgColor extends StatelessWidget {
  const MyBgColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [
            Color(0xFF666666),
            Colors.black,
          ],
        ),
      ),
    );
  }
}
