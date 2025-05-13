import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/dm/presentation/widgets/dm_input.dart';
import 'package:artemi_project/src/features/dm/presentation/widgets/chat_example.dart';
import 'package:artemi_project/src/features/dm/presentation/widgets/titleand_close_button.dart';

class DmOverlay extends StatelessWidget {
  const DmOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
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
              TitleandCloseButton(),
              const Divider(color: Colors.white54),
              ChatExample(),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10),
                child: DmInput(),
              ),
            ],
          ),
        );
      },
    );
  }
}
