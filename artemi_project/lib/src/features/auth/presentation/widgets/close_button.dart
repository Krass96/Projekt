import 'package:flutter/material.dart';

class MyCloseButton extends StatelessWidget {
  const MyCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: const Color(0xFFFFFFFF),
          ),
          color: const Color(0x8B323232),
        ),
        padding: const EdgeInsets.all(4),
        child: const Icon(
          Icons.close_sharp,
          color: Color(0xFFFFFFFF),
          size: 22,
        ),
      ),
    );
  }
}
