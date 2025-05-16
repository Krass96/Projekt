import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final overlay = Overlay.of(context);
        final overlayEntry = OverlayEntry(
          builder: (context) => Positioned(
            top: kToolbarHeight + 15,
            right: 15,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Saved ✅',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        );

        overlay.insert(overlayEntry);

        Future.delayed(const Duration(seconds: 2), () {
          overlayEntry.remove();
        });
      },
      icon: Icon(
        Icons.save_alt,
        size: 32,
        color: Palette.artGold,
      ),
    );
  }
}
