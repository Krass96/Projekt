import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/email_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/password_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/user_name_field.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNameField(usernameController: usernameController),
        const SizedBox(height: 10),
        EmailField(
          emailController: emailController,
        ),
        const SizedBox(height: 10),
        PasswordField(
          controller: passwordController,
          obscureText: _obscureText,
          onToggleVisibility: _toggleVisibility,
        ),
        const SizedBox(height: 10),
        PasswordField(
          controller: repeatPasswordController,
          obscureText: _obscureText,
          onToggleVisibility: _toggleVisibility,
          showVisibility: true,
        ),
        const SizedBox(height: 30),
        Button(
          text: 'Create',
          width: 200,
          fontSize: 24,
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/dashboard',
            );
          },
        ),
        const SizedBox(height: 50),
        Center(
          child: Opacity(
            opacity: 0.4,
            child: LogoWidget(width: 120),
          ),
        ),
      ],
    );
  }
}
