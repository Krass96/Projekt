import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';

class LoginOverlay extends StatefulWidget {
  const LoginOverlay({super.key});

  @override
  State<LoginOverlay> createState() => _LoginOverlayState();
}

class _LoginOverlayState extends State<LoginOverlay> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(color: const Color(0xA0000000)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.83,
            child: Container(
              decoration: 
            ),
          )
        ],
      ),
    );
  }
}
