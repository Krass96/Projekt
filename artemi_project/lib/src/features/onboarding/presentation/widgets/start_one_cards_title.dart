import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class StartOneCardsTitle extends StatelessWidget {
  const StartOneCardsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 32.83,
      child: Text(title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Palette.artGold)),
    );
  }
}
