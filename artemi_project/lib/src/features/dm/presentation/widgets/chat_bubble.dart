import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        spacing: 6,
        children: [
          ProfileAvatar(width: 50, height: 50),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: isSender
                    ? Palette.bitcoinOrange
                    : const Color.fromARGB(87, 255, 208, 0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: TextStyle(color: isSender ? Colors.black : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
