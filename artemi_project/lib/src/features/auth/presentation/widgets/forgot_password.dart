import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forgot Password?',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.lightBlueAccent),
      ),
    );
  }
}
