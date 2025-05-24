import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  const CategoryButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Palette.textColor),
      ),
      onPressed: () {},
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black)),
    );
  }
}
