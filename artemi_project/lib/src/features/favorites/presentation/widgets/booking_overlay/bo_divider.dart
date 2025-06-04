import 'package:flutter/material.dart';

class BoDivider extends StatelessWidget {
  const BoDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 5,
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
