import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/booking_confirm.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:artemi_project/src/widgets/preis_scala.dart';
import 'package:flutter/material.dart';

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

  Future<void> _selectDateTime(TextEditingController controller) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Palette.artGold,
              onPrimary: Colors.black,
              surface: Colors.black,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: const TimePickerThemeData(
                backgroundColor: Colors.black,
                hourMinuteTextColor: Colors.black,
                dialHandColor: Palette.artGold,
                dialBackgroundColor: Colors.grey,
              ),
              colorScheme: const ColorScheme.dark(
                primary: Palette.artGold,
                onPrimary: Colors.black,
                onSurface: Colors.white,
              ),
            ),
            child: child!,
          );
        },
      );

      if (time != null) {
        final formatted = '${date.day}.${date.month}.${date.year} '
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
        controller.text = formatted;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.75;
    return Container(
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(77, 255, 255, 255)),
        color: Color.fromARGB(243, 0, 0, 0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => _selectDateTime(_startController),
                          child: AbsorbPointer(
                            child: TextField(
                              controller: _startController,
                              decoration: MyInputDecoration.styled(
                                context: context,
                                hintText: 'Start',
                                labelText: 'Start',
                                prefixIcon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () => _selectDateTime(_endController),
                          child: AbsorbPointer(
                            child: TextField(
                              controller: _endController,
                              decoration: MyInputDecoration.styled(
                                context: context,
                                hintText: 'End',
                                labelText: 'End',
                                prefixIcon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  PreisScala(
                    values: widget.values,
                    onChanged: widget.onChanged,
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
