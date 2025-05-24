import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';

class MyCheckBox extends StatefulWidget {
  final String label;
  const MyCheckBox({super.key, required this.label});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
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
          widget.label,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Palette.textColor),
        ),
      ],
    );
  }
}
