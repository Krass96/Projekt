import 'package:artemi_project/src/common/back_chevron.dart';
import 'package:artemi_project/src/common/my_bg_wrapper.dart';
import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_two_cards_row.dart';
import 'package:artemi_project/src/theme/my_font.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/widgets/start_one_scala.dart';
import 'package:flutter/material.dart';

class StartTwo extends StatelessWidget {
  const StartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackChevron(),
        actions: [StartOneScala(widthYellow: 300)],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'You are',
              style: TextStyle(
                  color: Palette.textColor,
                  fontFamily: myFont.fontFamily,
                  fontSize: 50),
            ),
          ),
          StartTwoCardsRow(),
          SizedBox(height: 50),
          Image.asset('assets/images/you_are.png'),
          SizedBox(height: 40),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            ),
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
