import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/date_time_field.dart';

class DateTimeFieldsSection extends StatelessWidget {
  final TextEditingController startController;
  final TextEditingController endController;

  const DateTimeFieldsSection({
    super.key,
    required this.startController,
    required this.endController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: Column(
        children: [
          DateTimeField(
            controller: startController,
            label: 'Start',
          ),
          const SizedBox(height: 12),
          DateTimeField(
            controller: endController,
            label: 'End',
          ),
        ],
      ),
    );
  }
}
