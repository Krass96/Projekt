import 'package:artemi_project/src/common/my_input_decoration.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class DateTimeField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const DateTimeField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDateTime(context, controller),
      child: AbsorbPointer(
        child: TextField(
          controller: controller,
          decoration: MyInputDecoration.styled(
            context: context,
            hintText: label,
            labelText: label,
            prefixIcon: const Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDateTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final date = await _showDatePicker(context);
    if (date == null) return;

    final time = await _showTimePicker(context);
    if (time == null) return;

    final formatted = '${date.day}.${date.month}.${date.year} '
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    controller.text = formatted;
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    return showDatePicker(
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
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context) => showTimePicker(
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
}
