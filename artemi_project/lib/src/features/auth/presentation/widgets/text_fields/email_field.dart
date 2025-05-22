import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/my_input_decoration.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;

  const EmailField({super.key, this.controller});

  String? emailValidator(String? value) {
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
      return 'Please enter a valid email address: \n(name@example.com)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).primaryColor,
      style: Theme.of(context).textTheme.titleSmall,
      validator: emailValidator,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: MyInputDecoration.styled(
        context: context,
        hintText: 'Enter your mail@.com',
        labelText: 'Email',
      ),
    );
  }
}
