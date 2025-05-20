import 'package:artemi_project/src/features/dm/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatExample extends StatelessWidget {
  final List<String> messages;
  const ChatExample({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ChatBubble(
          message: messages[index],
          isSender: true,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: messages.length,
        controller: scrollController,
      ),
    );
  }
}
