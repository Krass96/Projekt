// event_create_overlay.dart
import 'package:artemi_project/src/theme/my_input_decoration.dart';
import 'package:flutter/material.dart';

class EventCreateOverlay extends StatefulWidget {
  final Function(String title, String description) onCreate;

  const EventCreateOverlay({
    super.key,
    required this.onCreate,
  });

  @override
  State<EventCreateOverlay> createState() => _EventCreateOverlayState();
}

class _EventCreateOverlayState extends State<EventCreateOverlay> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 24,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Create a new Event  🗓️',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: MyInputDecoration.styled(
              context: context,
              hintText: 'Set Title for your Event',
              labelText: 'Event Title',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: MyInputDecoration.styled(
              context: context,
              hintText: 'Event details...',
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              final title = _titleController.text.trim();
              final description = _descriptionController.text.trim();

              if (title.isNotEmpty && description.isNotEmpty) {
                widget.onCreate(title, description);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Create'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
