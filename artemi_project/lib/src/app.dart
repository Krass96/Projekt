import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/artist_galery/galery.dart';
import 'package:artemi_project/src/features/book/presentation/favorites_screen.dart';
import 'package:artemi_project/src/features/home/presentation/home.dart';
import 'package:artemi_project/src/features/onboarding/presentation/welcome_screen.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';
import 'package:artemi_project/src/features/profile/presentation/my_stage.dart';
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
        '/dashboard': (context) => DashBoard(),
        '/favorites': (context) => Favorites(),
        '/events': (context) => Galery(),
        '/mystage': (context) => MyStage(
              user: UserProfile(
                  id: '1',
                  userName: 'Varnaliev',
                  password: '********',
                  eMail: 'test@web.de',
                  genres: ['Music'],
                  status: ['Evenings'],
                  priceScala: 1000),
            ),
      },
    );
  }
}
