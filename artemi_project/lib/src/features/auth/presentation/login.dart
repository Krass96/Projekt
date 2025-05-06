import 'package:artemi_project/src/features/auth/domain/login_buttons.dart';
import 'package:artemi_project/src/features/auth/domain/login_text.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/login.png', fit: BoxFit.cover),
          LoginText(),
          LoginButtons(),
        ],
      ),
    );
  }
}
