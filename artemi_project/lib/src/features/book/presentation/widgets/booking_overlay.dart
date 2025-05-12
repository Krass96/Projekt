import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/widgets/preis_scala.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/booking_confirm.dart';

class BookingOverlay extends StatelessWidget {
  final RangeValues values;
  final Function(RangeValues) onChanged;

  const BookingOverlay({
    super.key,
    required this.values,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xD3000000),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 150, bottom: 50),
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: IconButton(
                      icon: Icon(Icons.save_alt),
                      onPressed: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Saved',
                            style: TextStyle(color: Palette.artGold),
                          ),
                          backgroundColor: Color.fromARGB(132, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: MyInputDecoration.styled(
                    context: context,
                    hintText: 'Enter your Event Title',
                    labelText: 'Event Title',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextField(
                  decoration: MyInputDecoration.styled(
                    suffixIcon: const Icon(Icons.location_on),
                    context: context,
                    hintText: 'Enter your Event Location',
                    labelText: 'Event Location',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: MyInputDecoration.styled(
                          context: context,
                          hintText: 'Start',
                          labelText: 'Start',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        decoration: MyInputDecoration.styled(
                          context: context,
                          hintText: 'End',
                          labelText: 'End',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              PreisScala(
                values: values,
                onChanged: onChanged,
              ),
              const SizedBox(height: 24),
              Button(
                text: 'Book',
                icon: Icons.bookmark_add_outlined,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const BookingConfirmationDialog(),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
