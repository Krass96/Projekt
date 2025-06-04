import 'package:artemi_project/src/common/my_button.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BookButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MyButton(
      text: 'Book the Artist',
      width: 200,
      fontSize: 20,
      onPressed: onPressed,
    );
  }
}
