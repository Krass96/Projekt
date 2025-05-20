import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class DmInput extends StatefulWidget {
  final void Function(String) onSend;
  const DmInput({super.key, required this.onSend});

  @override
  State<DmInput> createState() => _DmInputState();
}

class _DmInputState extends State<DmInput> {
  TextEditingController chatController = TextEditingController();

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_circle_outline,
            size: 30, color: Palette.bitcoinOrange),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            controller: chatController,
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
          onPressed: () {
            if (chatController.text.isNotEmpty) {
              widget.onSend(chatController.text);
              chatController.clear();
            }
          },
        )
      ],
    );
  }
}
