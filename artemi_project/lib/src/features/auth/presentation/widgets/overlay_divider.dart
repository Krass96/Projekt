import 'package:flutter/material.dart';

class OverlayDivider extends StatelessWidget {
  const OverlayDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Container(
      height: 8,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    ));
  }
}
