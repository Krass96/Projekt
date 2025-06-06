import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/app_theme.dart';
import 'package:artemi_project/src/theme/my_bg_color.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/common/splash_screen_shimmer.dart';
import 'package:artemi_project/src/features/home/presentation/home.dart';
import 'package:artemi_project/src/features/profile/presentation/my_stage.dart';
import 'package:artemi_project/src/features/events/presentation/my_events.dart';
import 'package:artemi_project/src/features/favorites/presentation/favorites_screen.dart';

class App extends StatelessWidget {
  final DatabaseRepository db;
  const App(this.db, {super.key});

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
              child: SplashScreen(),
            )
          ],
        ),
      ),
      routes: {
        '/dashboard': (context) => DashBoard(),
        '/favorites': (context) => Favorites(),
        '/events': (context) => MyEvents(),
        '/mystage': (context) => MyStage(),
        '/login': (context) => Login(),
      },
    );
  }
}
