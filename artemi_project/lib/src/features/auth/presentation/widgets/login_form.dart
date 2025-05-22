import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/forgot_password.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/email_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/password_field.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EmailField(
            emailController: emailController,
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: passwordController,
            obscureText: _obscureText,
            onToggleVisibility: _toggleVisibility,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              RememberMeCheckbox(),
              ForgotPassword(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Button(
              width: 200,
              fontSize: 24,
              text: 'Login',
              onPressed: () => Navigator.pushNamed(
                context,
                '/dashboard',
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Opacity(
              opacity: 0.4,
              child: LogoWidget(width: 130),
            ),
          ),
        ],
      ),
    );
  }
}
