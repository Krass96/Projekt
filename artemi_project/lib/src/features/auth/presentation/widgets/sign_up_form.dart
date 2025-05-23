import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/email_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/password_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/repeat_password.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/user_name_field.dart';
import 'package:artemi_project/src/common/my_button.dart';
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
  bool _isButtonEnabled = false;
  final formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _userNameController.removeListener(_validateForm);
    _emailController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    _confirmPasswordController.removeListener(_validateForm);

    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateForm() {
    final isUserNameFilled = _userNameController.text.isNotEmpty;
    final isEmailFilled = _emailController.text.isNotEmpty;
    final isPasswordFilled = _passwordController.text.isNotEmpty;
    final isConfirmPasswordFilled = _confirmPasswordController.text.isNotEmpty;

    if (isUserNameFilled &&
        isEmailFilled &&
        isPasswordFilled &&
        isConfirmPasswordFilled) {
      final userNameError = _validateUserName(_userNameController.text);
      final emailError = _validateEmail(_emailController.text);
      final passwordError = _validatePassword(_passwordController.text);
      final confirmPasswordError =
          _validateConfirmPassword(_confirmPasswordController.text);

      final isFormValid = userNameError == null &&
          emailError == null &&
          passwordError == null &&
          confirmPasswordError == null;

      setState(() {
        _isButtonEnabled = isFormValid;
      });
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (value.length > 20) {
      return 'Username cannot be longer than 20 characters';
    }
    if (value.contains(' ')) {
      return 'Username cannot contain spaces';
    }
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, numbers and underscores';
    }
    return null;
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          UserNameField(controller: _userNameController),
          const SizedBox(height: 10),
          EmailField(controller: _emailController),
          const SizedBox(height: 10),
          PasswordField(
            obscureText: _obscureText,
            onToggleVisibility: _toggleVisibility,
            controller: _passwordController,
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
          const SizedBox(height: 10),
          RepeatPasswordField(
            obscureText: _obscureText,
            onToggleVisibility: _toggleVisibility,
            controller: _confirmPasswordController,
            passwordController: _passwordController,
          ),
          const SizedBox(height: 30),
          MyButton(
            text: 'Create',
            width: 200,
            fontSize: 24,
            onPressed: _isButtonEnabled
                ? () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/dashboard');
                    }
                  }
                : null,
          ),
          const SizedBox(height: 40),
          Center(
            child: Opacity(
              opacity: 0.4,
              child: LogoWidget(width: 120),
            ),
          ),
        ],
      ),
    );
  }
}
