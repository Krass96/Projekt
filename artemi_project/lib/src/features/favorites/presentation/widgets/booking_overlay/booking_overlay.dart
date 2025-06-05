import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/events/domain/events.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/preis_scala.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/bo_divider.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/book_button.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/booking_confirm.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/booking_title.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/date_time_fields_section.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/event_title_field.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/location_field.dart';
import 'package:artemi_project/src/features/events/presentation/my_events.dart';

class BookingOverlay extends StatefulWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;
  final String selectedArtist;

  const BookingOverlay({
    super.key,
    required this.values,
    required this.onChanged,
    required this.selectedArtist,
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

  Future<void> _showBookingConfirmation(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (_) => const BookingConfirmationDialog(),
    );

    if (result == null) {
      await _saveEvent();
      _navigateToMyEvents();
    }
  }

  Future<void> _saveEvent() async {
    final repo = MockDatabaseRepository();
    final start = DateTime.tryParse(_startController.text) ?? DateTime.now();
    final end = DateTime.tryParse(_endController.text) ?? DateTime.now();
    final newEvent = Event(
      eventId: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Event with ${widget.selectedArtist}',
      description: 'Start: ${_startController.text}\n'
          'End: ${_endController.text}\n'
          'Price: ${widget.values.start.toInt()}€ - ${widget.values.end.toInt()}€',
      artistName: widget.selectedArtist,
      start: start,
      end: end,
      location: 'Hamburg',
      price: widget.values.end.toDouble(),
    );

    await repo.addEvent(newEvent);
  }

  void _navigateToMyEvents() {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MyEvents(),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
