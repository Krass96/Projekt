import 'package:artemi_project/Klassen/button.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'WELCOME TO ARTEMI',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decorationColor: Colors.amberAccent),
                  ),
                  SizedBox(height: 50),
                  Image.asset(
                    'assets/images/Logo_frame.png',
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 10),
                  Text(
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
            Button(
                text: 'Get Started',
                icon: LucideIcons.chevronRight,
                alignment: Alignment.bottomCenter)
          ],
        ),
      ),
    );
  }
}
