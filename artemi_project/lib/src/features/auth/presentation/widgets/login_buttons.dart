import 'package:artemi_project/src/features/book/presentation/favorites_screen.dart';
import 'package:artemi_project/src/features/auth/presentation/login_overlay.dart';
import 'package:artemi_project/src/features/auth/presentation/sing_up_overlay.dart';
import 'package:artemi_project/src/features/home/presentation/home.dart';
import 'package:artemi_project/src/common/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyButton(
            text: 'Log In',
            fontSize: 22,
            width: 300,
            height: 50,
            onPressed: () => showLoginBottomSheet(context),
          ),
          MyButton(
            text: 'Sign Up',
            fontSize: 22,
            width: 300,
            height: 50,
            onPressed: () => showSignUpBottomSheet(context),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Text('or', style: Theme.of(context).textTheme.headlineSmall),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SignInWithAppleButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashBoard(),
                ),
              ),
              height: 50,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ],
      ),
    );
  }
}
