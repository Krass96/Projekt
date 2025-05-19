import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/forgot_password.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/remember_me_checkbox.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;

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
          TextField(
            decoration: MyInputDecoration.styled(
              context: context,
              hintText: 'Enter your mail or username',
              labelText: 'Email / Username',
            ),
          ),
          const SizedBox(height: 20),
          PasswordField(
            controller: widget.passwordController,
            hintText: 'Enter your password',
            labelText: 'Password',
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
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Opacity(
              opacity: 0.4,
              child: LogoWidget(widht: 130),
            ),
          ),
        ],
      ),
    );
  }
}
