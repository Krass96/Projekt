import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BackChevron extends StatelessWidget {
  const BackChevron({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        LucideIcons.chevronLeft,
        color: Color(0xFFFFEE32),
        size: 40,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
