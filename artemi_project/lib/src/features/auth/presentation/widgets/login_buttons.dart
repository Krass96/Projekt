import 'package:artemi_project/src/features/book/presentation/my_events.dart';
import 'package:artemi_project/src/features/auth/presentation/login_overlay.dart';
import 'package:artemi_project/src/features/auth/presentation/sing_up_overlay.dart';
import 'package:artemi_project/src/widgets/button.dart';
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Button(
            text: 'Log In',
            fontSize: 22,
            width: 300,
            height: 50,
            onPressed: () => showLoginBottomSheet(context),
          ),
          Button(
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
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SignInWithAppleButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyEvents(),
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
