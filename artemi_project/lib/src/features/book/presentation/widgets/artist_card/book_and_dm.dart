import 'package:artemi_project/src/features/book/presentation/widgets/booking_overlay/booking_overlay.dart';
import 'package:artemi_project/src/features/dm/presentation/dm.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class BookAndDm extends StatefulWidget {
  const BookAndDm({super.key});

  @override
  State<BookAndDm> createState() => _BookAndDmState();
}

class _BookAndDmState extends State<BookAndDm> {
  RangeValues _values = const RangeValues(0, 10000);

  void _openBookingOverlay() {
    showBookingOverlay(
      context,
      values: _values,
      onChanged: (newValues) {
        setState(() {
          _values = newValues;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Palette.artGold,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: _openBookingOverlay,
            icon: const Icon(
              Icons.event,
              size: 30,
              color: Palette.artGold,
            ),
            label: Text(
              'Book',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Container(width: 1, height: 40, color: Colors.white),
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Palette.artGold,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const DmOverlay(),
              );
            },
            icon: const Icon(
              Icons.chat,
              size: 30,
              color: Palette.artGold,
            ),
            label: Text(
              'DM',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}

void showBookingOverlay(
  BuildContext context, {
  required RangeValues values,
  required Function(RangeValues) onChanged,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BookingOverlay(
        values: values,
        onChanged: onChanged,
      );
    },
  );
}
