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
}
