import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String? title;

  const AppBarTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '',
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontStyle: FontStyle.normal),
    );
  }
}
