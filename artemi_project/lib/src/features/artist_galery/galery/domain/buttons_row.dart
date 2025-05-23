import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final Color buttonColor;

  const ButtonsRow({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: onPrevious,
          child: Icon(Icons.chevron_left, size: 32, color: Colors.black),
        ),
        const SizedBox(width: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(),
          onPressed: onNext,
          child: Icon(Icons.chevron_right, size: 32, color: Colors.black),
        ),
      ],
    );
  }
}
