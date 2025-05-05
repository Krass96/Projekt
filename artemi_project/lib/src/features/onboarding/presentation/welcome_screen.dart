import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/theme/my_font.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'start_one.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyBgColor(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              Text(
                'WELCOME TO ARTEMI',
                style: welcomeTitle,
              ),
              const SizedBox(height: 40),
              const LogoWidget(),
              const SizedBox(height: 30),
              Text(
                '"CONNECTING ARTIST AND EVENTS, EASY PEASY"',
                style: welcomeSubtitle,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Button(
            width: 250,
            height: 60,
            text: 'Get Started',
            icon: LucideIcons.chevronRight,
            alignment: Alignment.bottomCenter,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StartOne(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
