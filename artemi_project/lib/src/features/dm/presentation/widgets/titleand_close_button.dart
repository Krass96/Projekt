import 'package:artemi_project/src/features/auth/presentation/widgets/close_button.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class TitleandCloseButton extends StatelessWidget {
  const TitleandCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 100, left: 110),
          child: Text(
            "💬 DMs",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Palette.bitcoinOrange),
          ),
        ),
        MyCloseButton()
      ],
    );
  }
}
