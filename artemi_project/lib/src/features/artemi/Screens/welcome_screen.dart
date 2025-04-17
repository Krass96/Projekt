import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'start_one.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'WELCOME TO ARTEMI',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decorationColor: Colors.amberAccent),
                ),
                const SizedBox(height: 50),
                const LogoWidget(),
                const SizedBox(height: 20),
                const Text(
                  '"CONNECTING ARTIST AND EVENTS, EASY PEASY"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Button(
              text: 'Get Started',
              icon: LucideIcons.chevronsRight,
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
      ),
    );
  }
}
