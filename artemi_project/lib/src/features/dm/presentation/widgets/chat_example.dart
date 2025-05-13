import 'package:artemi_project/src/features/dm/presentation/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatExample extends StatelessWidget {
  const ChatExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var scrollController;
    return Expanded(
      child: ListView(
        controller: scrollController,
        children: const [
          ChatBubble(
            message:
                "Hallo! Ich interessiere mich für deine Kunst. Bist du für ein Event verfügbar?",
            isSender: false,
          ),
          ChatBubble(
            message:
                "Hi! Danke für deine Nachricht. Wann und wo soll das Event stattfinden?",
            isSender: true,
          ),
          ChatBubble(
            message:
                "Es ist am 15. März in Hamburg. Ich brauche eine Live-Performance für ca. 2 Stunden.",
            isSender: false,
          ),
          ChatBubble(
            message:
                "Natürlich, ich schicke dir gleich einen Termin-Vorschlag.",
            isSender: true,
          ),
        ],
      ),
    );
  }
}
