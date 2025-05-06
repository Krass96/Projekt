import 'package:artemi_project/src/features/auth/presentation/login_overlay.dart';
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOverlay(),
              ),
            ),
            width: 300,
            height: 50,
          ),
          Button(
            text: 'Sign In',
            fontSize: 22,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOverlay(),
              ),
            ),
            width: 300,
            height: 50,
          ),
          Text('or', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: 10,
          ),
          SignInWithAppleButton(
            onPressed: () {},
            height: 50,
            borderRadius: BorderRadius.circular(60),
          ),
        ],
      ),
    );
  }
}
