import 'package:artemi_project/src/features/favorites/presentation/widgets/booking_overlay/booking_overlay.dart';
import 'package:artemi_project/src/features/dm/presentation/dm.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookAndDm extends StatefulWidget {
  const BookAndDm({super.key});

  @override
  State<BookAndDm> createState() => _BookAndDmState();
}

class _BookAndDmState extends State<BookAndDm> {
  RangeValues _values = const RangeValues(0, 10000);
  final String selectedArtist = 'Leonardo';

  void _openBookingOverlay() {
    showBookingOverlay(
      context,
      values: _values,
      onChanged: (newValues) {
        setState(() {
          _values = newValues;
        });
      },
      selectedArtist: selectedArtist,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.white),
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Palette.artGold,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: _openBookingOverlay,
                icon: const FaIcon(
                  FontAwesomeIcons.cartPlus,
                  color: Palette.artGold,
                  size: 22,
                ),
                label: Text(
                  'Book',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
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
                icon: const FaIcon(
                  FontAwesomeIcons.paperPlane,
                  color: Palette.artGold,
                  size: 22,
                ),
                label: Text(
                  'DM',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void showBookingOverlay(
  BuildContext context, {
  required RangeValues values,
  required Function(RangeValues) onChanged,
  required String selectedArtist,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BookingOverlay(
        values: values,
        onChanged: onChanged,
        selectedArtist: selectedArtist,
      );
    },
  );
}
