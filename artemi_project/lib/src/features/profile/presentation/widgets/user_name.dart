import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Lorem Ipsum',
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }
}
