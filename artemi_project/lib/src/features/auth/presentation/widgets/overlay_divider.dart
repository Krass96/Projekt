import 'package:flutter/material.dart';

class OverlayDivider extends StatelessWidget {
  const OverlayDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(150.0),
        child: Divider(
          thickness: 5,
          color: Colors.white70,
        ),
      ),
    );
  }
}
