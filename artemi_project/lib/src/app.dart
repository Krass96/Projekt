import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/book/presentation/my_events.dart';
import 'package:artemi_project/src/features/onboarding/presentation/welcome_screen.dart';
import 'package:artemi_project/src/features/profile/presentation/user_profile.dart';
import 'package:artemi_project/src/theme/app_theme.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: MyScaffold(
        body: Stack(
          children: [
            MyBgColor(),
            Material(
              type: MaterialType.transparency,
              child: WelcomeScreen(),
            ),
          ],
        ),
      ),
      routes: {
        //'/home': (context) => HomeScreen(),
        '/events': (context) => MyEvents(),
        //'/favorites': (context) => FavoriteScreen(),
        '/profile': (context) => UserProfile(),
      },
    );
  }
}
