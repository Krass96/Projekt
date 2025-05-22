import 'package:artemi_project/src/common/my_input_decoration.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  String? emailValidator(String? value) {
    if (value == null || !value.contains('@')) {
      return 'Please enter a valid email';
    }
    if (value.isEmpty) {
      return 'Please enter an email';
    }
    if (value.length < 5) {
      return 'Email must be at least 5 characters';
    }
    if (value.contains(' ')) {
      return 'Email cannot contain spaces " "';
    }

    return null;
  }

  void initState() {
    emailController.addListener(() {
      if (emailController.text.isEmpty) {
        emailController.clear();
      }
    });
  }

  void dispose() {
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).colorScheme.error,
      style: Theme.of(context).textTheme.titleSmall,
      validator: emailValidator,
      controller: emailController,
      decoration: MyInputDecoration.styled(
        context: context,
        hintText: 'Enter your mail@.com',
        labelText: 'Email',
      ),
    );
  }
}
