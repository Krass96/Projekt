// event_create_overlay.dart
import 'package:artemi_project/src/common/my_button.dart';
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
  final _formKey = GlobalKey<FormState>();

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

  void _handleCreate() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onCreate(
      _titleController.text.trim(),
      _descriptionController.text.trim(),
    );
    Navigator.of(context).pop();
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Create a new Event 🗓️',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: MyInputDecoration.styled(
                context: context,
                hintText: 'Set Title for your Event',
                labelText: 'Event Title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              maxLines: 2,
              decoration: MyInputDecoration.styled(
                context: context,
                hintText: 'Event details...',
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
                width: double.infinity,
                child: MyButton(
                  onPressed: _handleCreate,
                  text: 'Create 🔥',
                  width: 200,
                  fontSize: 20,
                )),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
