import 'package:artemi_project/src/widgets/button.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  final VoidCallback onPressed;

  const BookButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'Book the Artist',
      width: 200,
      fontSize: 20,
      onPressed: onPressed,
    );
  }
}
