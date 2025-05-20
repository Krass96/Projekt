import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
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
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('Welcome to Artemi',
                    curve: Curves.easeIn,
                    textStyle: Theme.of(context).textTheme.displaySmall)
              ]),
              const SizedBox(height: 40),
              const LogoWidget(width: 200),
              const SizedBox(height: 30),
              AnimatedTextKit(animatedTexts: [
                TyperAnimatedText('"CONNECTING ARTIST AND EVENTS, EASY PEASY"',
                    curve: Curves.easeIn)
              ]),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(36.0),
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
