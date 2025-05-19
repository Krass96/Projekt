import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
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
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.usernameController,
          decoration: MyInputDecoration.styled(
            context: context,
            hintText: 'Enter Username',
            labelText: 'Username',
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: widget.emailController,
          decoration: MyInputDecoration.styled(
            context: context,
            hintText: 'Enter your email address',
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 10),
        PasswordField(
          controller: widget.passwordController,
          hintText: 'Create your password',
          labelText: 'Password',
          obscureText: _obscureText,
          onToggleVisibility: _toggleVisibility,
        ),
        const SizedBox(height: 10),
        PasswordField(
          controller: widget.passwordController,
          hintText: 'Repeat your password',
          labelText: 'Repeat password',
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
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 50),
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
