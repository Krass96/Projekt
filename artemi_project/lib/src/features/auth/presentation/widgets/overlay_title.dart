import 'package:flutter/material.dart';

class OverlayTitle extends StatelessWidget {
  const OverlayTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Text(
        'Welcome Back! 🖐️',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
