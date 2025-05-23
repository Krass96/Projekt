import 'package:artemi_project/src/theme/my_input_decoration.dart';
import 'package:flutter/material.dart';

class EventTitleField extends StatelessWidget {
  const EventTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: MyInputDecoration.styled(
          context: context,
          hintText: 'Enter your Event Title',
          labelText: 'Event Title',
        ),
      ),
    );
  }
}
