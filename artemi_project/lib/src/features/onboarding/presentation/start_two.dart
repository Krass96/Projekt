import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/common/my_button.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/app_bar/back_chevron.dart';
import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one/start_one_scala.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_two/start_two_cards_row.dart';

class StartTwo extends StatefulWidget {
  const StartTwo({super.key});

  @override
  State<StartTwo> createState() => _StartTwoState();
}

class _StartTwoState extends State<StartTwo> {
  int? selectedRole;

  void onRoleSelected(int index) {
    setState(() {
      selectedRole = index;
    });
  }

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
            StartTwoCardsRow(
              selected: selectedRole,
              onSelected: onRoleSelected,
            ),
            SizedBox(height: 0),
            Image.asset('assets/images/you_are.png'),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/login',
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
                MyButton(
                  width: 150,
                  text: 'Continue',
                  fontSize: 20,
                  onPressed: selectedRole != null
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          )
                      : null,
                  backgroundColor: selectedRole != null
                      ? Palette.artGold
                      : const Color(0xFF979696),
                  foregroundColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
