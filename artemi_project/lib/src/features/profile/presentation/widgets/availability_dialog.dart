import 'package:flutter/material.dart';

class AvailabilityDialog extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final Function(String) onSelect;

  const AvailabilityDialog({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Set your Status 🗓️',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Divider(
              color: const Color(0xABFFFFFF),
            ),
            SizedBox(height: 5),
            Container(
              constraints: BoxConstraints(maxHeight: 250),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options[index];
                  return InkWell(
                    onTap: () {
                      onSelect(option);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      color: selectedOption == option
                          ? Colors.grey[900]
                          : Colors.transparent,
                      child: Text(
                        option,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Color(0xABFFFFFF),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailabilityButton extends StatelessWidget {
  final String selectedAvailability;
  final VoidCallback onTap;

  const AvailabilityButton({
    super.key,
    required this.selectedAvailability,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedAvailability,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Icon(Icons.keyboard_arrow_up, color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
