import 'package:artemi_project/src/theme/my_input_decoration.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class RepeatPasswordField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final TextEditingController? controller;
  final TextEditingController passwordController;
  final bool showVisibility;

  const RepeatPasswordField({
    super.key,
    required this.obscureText,
    required this.onToggleVisibility,
    this.controller,
    required this.passwordController,
    this.showVisibility = true,
  });

  String? repeatPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: repeatPasswordValidator,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Palette.artGold,
      style: TextStyle(color: Palette.textColor),
      decoration: MyInputDecoration.styled(
        context: context,
        labelText: 'Confirm Password',
        hintText: 'Repeat your password',
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
