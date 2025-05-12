import 'package:artemi_project/src/features/auth/presentation/widgets/close_button.dart';
import 'package:artemi_project/src/features/dm/presentation/widgets/chat_bubble.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class DmOverlay extends StatelessWidget {
  const DmOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(77, 255, 255, 255)),
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100, left: 110),
                    child: Text(
                      "💬 DMs",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Palette.bitcoinOrange),
                    ),
                  ),
                  MyCloseButton()
                ],
              ),
              const Divider(color: Colors.white54),
              Expanded(
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
              ),
              const SizedBox(height: 8),
              // Inputbereich
              Row(
                children: [
                  const Icon(Icons.add_circle_outline, color: Colors.yellow),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[900],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.yellow),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
