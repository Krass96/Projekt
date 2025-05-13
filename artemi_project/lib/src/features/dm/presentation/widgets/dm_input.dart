import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class DmInput extends StatelessWidget {
  const DmInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_circle_outline,
            size: 30, color: Palette.bitcoinOrange),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[900],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send, color: Palette.bitcoinOrange),
          onPressed: () {},
        )
      ],
    );
  }
}
