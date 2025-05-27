import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final String name;

  const UserName({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
