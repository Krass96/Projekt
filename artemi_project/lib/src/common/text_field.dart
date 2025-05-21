import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';

class MyInputDecoration {
  static InputDecoration styled({
    required String hintText,
    required BuildContext context,
    String? labelText,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          TextStyle(color: Palette.textColor, fontStyle: FontStyle.italic),
      labelText: labelText,
      labelStyle:
          labelText != null ? Theme.of(context).textTheme.titleSmall : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Palette.textColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Color(0xC3FFFFFF), width: 2),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    );
  }

  static String? emailValidator(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final bool showVisibility;
  final bool obscureText;
  final Widget? suffixIcon;
  final VoidCallback onToggleVisibility;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.showVisibility = true,
    required this.obscureText,
    required this.onToggleVisibility,
    this.suffixIcon,
  });

  String? passwordValidator(String? value) {
    if (value == null || value.length < 6) {
      return 'Password must be at least 6 characters';
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
          labelText: labelText,
          hintText: hintText,
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

class EmailField extends StatelessWidget {
  final TextEditingController usernameController;

  const EmailField({super.key, required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).colorScheme.error,
      style: Theme.of(context).textTheme.titleSmall,
      validator: MyInputDecoration.emailValidator,
      controller: usernameController,
      decoration: MyInputDecoration.styled(
        context: context,
        hintText: 'Enter your mail@.com',
        labelText: 'Email',
      ),
    );
  }
}
