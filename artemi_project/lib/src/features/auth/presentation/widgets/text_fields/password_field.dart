import 'package:artemi_project/src/theme/my_input_decoration.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool showVisibility;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback onToggleVisibility;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;

  const PasswordField({
    super.key,
    this.showVisibility = true,
    required this.obscureText,
    required this.onToggleVisibility,
    this.suffixIcon,
    this.controller,
    this.labelText,
    this.hintText,
  });

  String? passwordValidator(String? value) {
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
      return '...one uppercase(A) letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return '...one lowercase(a) letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return '...one number';
    }

    if (!RegExp(r'[!@#$%^&*()_+\[\]{}|;:,.<>?]').hasMatch(value)) {
      return '...one special character (!@#\$%^&*)';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: passwordValidator,
      controller: controller,
      obscureText: showVisibility ? obscureText : true,
      cursorColor: Palette.artGold,
      style: TextStyle(color: Palette.textColor),
      decoration: MyInputDecoration.styled(
        context: context,
        labelText: labelText ?? 'Password',
        hintText: hintText ?? 'Enter your password',
        suffixIcon: showVisibility
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Palette.artGold,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
      ),
    );
  }
}
