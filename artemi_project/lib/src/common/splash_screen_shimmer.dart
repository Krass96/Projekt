import 'package:artemi_project/src/features/onboarding/presentation/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'dart:async';

class SplashScreenShimmer extends StatefulWidget {
  const SplashScreenShimmer({super.key});

  @override
  State<SplashScreenShimmer> createState() => _SplashScreenShimmerState();
}

class _SplashScreenShimmerState extends State<SplashScreenShimmer> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Palette.artGold.withOpacity(0.4),
          highlightColor: Palette.artGold,
          period: const Duration(seconds: 2),
          child: Image.asset(
            'assets/splash_screen/splash.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
