import 'package:flutter/material.dart';

class OverlayTitle extends StatelessWidget {
  final String title;

  const OverlayTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
