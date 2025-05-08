import 'package:artemi_project/src/features/auth/presentation/widgets/close_button.dart';
import 'package:flutter/material.dart';

class OverlayClose extends StatelessWidget {
  const OverlayClose({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 20,
      child: MyCloseButton(),
    );
  }
}
