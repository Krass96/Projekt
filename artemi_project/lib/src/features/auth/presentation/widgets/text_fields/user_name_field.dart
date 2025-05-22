import 'package:artemi_project/src/common/my_input_decoration.dart';
import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
    required this.usernameController,
  });

  final TextEditingController usernameController;

  void initState() {
    usernameController.addListener(() {
      if (usernameController.text.isEmpty) {
        usernameController.clear();
      }
    });
  }

  void dispose() {
    usernameController.dispose();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    if (value.contains(' ')) {
      return 'Username cannot contain spaces " "';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: usernameController,
      decoration: MyInputDecoration.styled(
        context: context,
        hintText: 'Enter Username',
        labelText: 'Username',
      ),
    );
  }
}
