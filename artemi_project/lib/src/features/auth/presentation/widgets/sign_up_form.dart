import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: usernameController,
          decoration: MyInputDecoration.styled(
            context: context,
            hintText: 'Enter Username',
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: emailController,
          decoration: MyInputDecoration.styled(
            context: context,
            hintText: 'Enter your email address',
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 10),
        PasswordField(
          controller: passwordController,
          hintText: 'Create your password',
          labelText: 'Password',
        ),
        const SizedBox(height: 10),
        PasswordField(
            controller: passwordController,
            hintText: 'Repeat your password',
            labelText: 'Repeat password'),
        const SizedBox(height: 30),
        Button(
          text: 'Create',
          width: 200,
          fontSize: 24,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 20),
        Center(
          child: Opacity(
            opacity: 0.4,
            child: LogoWidget(widht: 120),
          ),
        ),
      ],
    );
  }
}
