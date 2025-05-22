import 'package:artemi_project/src/theme/my_input_decoration.dart';
import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool showError;

  const UserNameField({
    super.key,
    this.controller,
    this.focusNode,
    this.showError = true,
  });

  String? usernameValidator(String? value) {
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
    // Nur Buchstaben, Zahlen und Unterstriche erlaubt
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, numbers and underscores';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).primaryColor,
      validator: (value) => showError ? usernameValidator(value) : null,
      controller: controller,
      focusNode: focusNode,
      decoration: MyInputDecoration.styled(
        context: context,
        hintText: 'Enter Username',
        labelText: 'Username',
      ),
    );
  }
}
