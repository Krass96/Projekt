import 'package:artemi_project/src/features/artemi/presentation/widgets/booking_confirm.dart';
import 'package:artemi_project/src/features/artist_galery/main_screen.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class BookAndDm extends StatelessWidget {
  const BookAndDm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              foregroundColor: Palette.artGold,
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const BookingConfirmationDialog();
                },
              );
            },
            icon: Icon(
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
              padding: EdgeInsets.symmetric(vertical: 12),
            ),
            onPressed: () {},
            icon: Icon(
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
