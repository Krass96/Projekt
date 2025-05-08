import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';

class RememberMeCheckbox extends StatefulWidget {
  const RememberMeCheckbox({super.key});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (newValue) {
            setState(() {
              _rememberMe = newValue ?? false;
            });
          },
          checkColor: Colors.black,
          activeColor: Palette.artGold,
        ),
        Text(
          'Remember Me',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Palette.textColor),
        ),
      ],
    );
  }
}
