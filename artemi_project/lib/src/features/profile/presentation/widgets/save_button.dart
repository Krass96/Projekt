import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SaveButton({
    super.key,
    this.onPressed,
  });

  void _showSavedOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: kToolbarHeight + 8,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text('Saved',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Palette.textColor,
                            fontWeight: FontWeight.w600,
                          )),
                ),
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {},
                  checkColor: Colors.black,
                  activeColor: Palette.artGold,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed != null
          ? () async {
              onPressed!();
              _showSavedOverlay(context);
            }
          : null,
      icon: Icon(
        Icons.save_alt,
        size: 32,
        color: onPressed != null ? Palette.artGold : Colors.grey,
      ),
    );
  }
}
