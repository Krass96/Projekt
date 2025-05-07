import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class MyInputDecoration {
  static InputDecoration styled({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          TextStyle(color: Palette.textColor, fontStyle: FontStyle.italic),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Palette.textColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        borderSide: BorderSide(color: Color(0xC3FFFFFF), width: 2),
      ),
      suffixIcon: suffixIcon,
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordField({
    super.key,
    required this.controller,
    this.hintText = 'Password',
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      cursorColor: Palette.artGold,
      style: TextStyle(color: Palette.textColor),
      decoration: MyInputDecoration.styled(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Palette.artGold,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
