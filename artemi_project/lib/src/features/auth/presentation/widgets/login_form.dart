import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/forgot_password.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/my_check_box.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/email_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/password_field.dart';
import 'package:artemi_project/src/common/my_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _isButtonEnabled = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateForm() {
    final isEmailFilled = _emailController.text.isNotEmpty;
    final isPasswordFilled = _passwordController.text.isNotEmpty;

    if (isEmailFilled && isPasswordFilled) {
      final emailError = _validateEmail(_emailController.text);
      final passwordError = _validatePassword(_passwordController.text);

      final isFormValid = emailError == null && passwordError == null;

      setState(() {
        _isButtonEnabled = isFormValid;
      });
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (value.length < 5) {
      return 'Email must be at least 5 characters';
    }
    if (value.contains(' ')) {
      return 'Email cannot contain spaces';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value.contains(' ')) {
      return 'Password cannot contain spaces';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }
    if (!RegExp(r'[!@#$%^&*()_+\[\]{}|;:,.<>?]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            EmailField(controller: _emailController),
            const SizedBox(height: 20),
            PasswordField(
              obscureText: _obscureText,
              onToggleVisibility: _toggleVisibility,
              controller: _passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MyCheckBox(label: 'Remember Me'),
                ForgotPassword(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: MyButton(
                width: 200,
                fontSize: 24,
                text: 'Login',
                onPressed: _isButtonEnabled
                    ? () {
                        final bool isFormValid =
                            formKey.currentState!.validate();
                        if (isFormValid) {
                          Navigator.pushNamed(context, '/dashboard');
                        }
                      }
                    : null,
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
      ),
    );
  }
}
