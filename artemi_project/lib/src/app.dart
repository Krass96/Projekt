import 'package:artemi_project/src/common/my_bg_wrapper.dart';
import 'package:artemi_project/src/features/onboarding/presentation/welcome_screen.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AppScaffold(
        body: Stack(
          children: [
            MyBgColor(),
            WelcomeScreen(),
          ],
        ),
      ),
    );
  }
}
