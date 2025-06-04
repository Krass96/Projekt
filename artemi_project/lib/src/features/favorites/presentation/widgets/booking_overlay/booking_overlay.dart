import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/preis_scala.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/bo_divider.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/book_button.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/booking_confirm.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/booking_title.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/date_time_fields_section.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/event_title_field.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/location_field.dart';

class BookingOverlay extends StatefulWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;

  const BookingOverlay({
    super.key,
    required this.values,
    required this.onChanged,
  });

  @override
  State<BookingOverlay> createState() => _BookingOverlayState();
}

class _BookingOverlayState extends State<BookingOverlay> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  @override
  void dispose() {
    _startController.dispose();
    _endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.75;
    return Container(
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(77, 255, 255, 255)),
        color: const Color.fromARGB(251, 0, 0, 0),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        children: [
          const BoDivider(),
          const BookingTitle(),
          const SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const EventTitleField(),
                  const SizedBox(height: 12),
                  const LocationField(),
                  const SizedBox(height: 12),
                  DateTimeFieldsSection(
                    startController: _startController,
                    endController: _endController,
                  ),
                  const SizedBox(height: 24),
                  PreisScala(
                    values: widget.values,
                    onChanged: widget.onChanged,
                  ),
                  const SizedBox(height: 24),
                  BookButton(
                    onPressed: () => _showBookingConfirmation(context),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const BookingConfirmationDialog(),
    );
  }
}
