import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/app_bar/back_chevron.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one_scala.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_two_cards_row.dart';

class StartTwo extends StatelessWidget {
  const StartTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackChevron(),
        actions: [StartOneScala(widthYellow: 300)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text('You are',
                  style: Theme.of(context).textTheme.displayLarge),
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
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
