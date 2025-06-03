import 'package:artemi_project/src/common/logo_widget.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/email_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/password_field.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/repeat_password.dart';
import 'package:artemi_project/src/features/auth/presentation/widgets/text_fields/user_name_field.dart';
import 'package:artemi_project/src/common/my_button.dart';
import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';
import 'package:artemi_project/src/services/user_service.dart'; // UserService hinzufügen
import 'package:flutter/material.dart';
import 'dart:math'; // Für die userId Generierung

class SignUpForm extends StatefulWidget {
  final DatabaseRepository databaseRepository;

  const SignUpForm({
    super.key,
    required this.databaseRepository,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscureText = true;
  bool _isButtonEnabled = false;
  bool _isLoading = false; // Für Loading State
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
      return 'Password must contain at least\none uppercase(A) letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least\none lowercase(a) letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least\none number';
    }
    if (!RegExp(r'[!@#$%^&*()_+\[\]{}|;:,.<>?]').hasMatch(value)) {
      return 'Password must contain at least\none special character (!@#\$%^&*)';
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

  Future<void> _createUser() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final newUser = UserProfile(
        userId: _generateUserId(),
        userName: _userNameController.text,
        password: _passwordController.text,
        eMail: _emailController.text,
        genres: [],
        status: [],
        priceScala: 0,
      );

      // Benutzer in Datenbank erstellen
      await widget.databaseRepository.createUser(newUser);

      // Benutzer als aktuellen Benutzer setzen
      UserService().setCurrentUser(newUser);

      // Erfolg - Navigation zum Dashboard
      if (mounted) {
        Navigator.pushNamed(context, '/dashboard');
      }
    } catch (error) {
      // Fehlerbehandlung
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Fehler beim Erstellen des Benutzers: $error'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Einfache userId Generierung (in der Praxis würden Sie UUID verwenden)
  String _generateUserId() {
    return DateTime.now().millisecondsSinceEpoch.toString() +
        Random().nextInt(1000).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
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
            text: _isLoading ? 'Creating... 🔄' : 'Create',
            width: 200,
            fontSize: 24,
            onPressed: (_isButtonEnabled && !_isLoading) ? _createUser : null,
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
