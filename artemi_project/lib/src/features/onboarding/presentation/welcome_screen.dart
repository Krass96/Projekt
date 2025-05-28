import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/common/my_button.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'start_one.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _showSecond = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyBgColor(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Welcome to Artemi',
                    curve: Curves.easeIn,
                    textStyle: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
                onFinished: () {
                  setState(() {
                    _showSecond = true;
                  });
                },
                isRepeatingAnimation: false,
              ),
              const SizedBox(height: 40),
              const LogoWidget(width: 200),
              const SizedBox(height: 30),
              if (_showSecond)
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      '"CONNECTING ARTIST AND EVENTS, EASY PEASY"',
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                              color: Palette.textColor,
                              fontStyle: FontStyle.italic),
                      curve: Curves.easeIn,
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: MyButton(
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
