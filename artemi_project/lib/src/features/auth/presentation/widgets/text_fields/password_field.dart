import 'package:artemi_project/src/common/my_input_decoration.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool showVisibility;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    this.showVisibility = true,
    required this.obscureText,
    required this.onToggleVisibility,
    this.suffixIcon,
  });

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (value.contains(' ')) {
      return 'Password cannot contain spaces " "';
    }
    if (value.contains(capsABC)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (value.contains(nums)) {
      return 'Password must contain at least one number';
    }
    if (value.contains(special)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUnfocus,
        validator: passwordValidator,
        controller: controller,
        obscureText: showVisibility ? obscureText : true,
        cursorColor: Palette.artGold,
        style: TextStyle(color: Palette.textColor),
        decoration: MyInputDecoration.styled(
          context: context,
          labelText: 'Password',
          hintText: 'Enter your password',
          suffixIcon: showVisibility
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Palette.artGold,
                  ),
                  onPressed: onToggleVisibility,
                )
              : IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
        ));
  }
}

String capsABC = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
String nums = '0123456789';
String special = r'!@#$%^&*()_+[]{}|;:,.<>?';
