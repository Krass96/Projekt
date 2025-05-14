import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/theme/my_font.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DateLabel extends StatefulWidget {
  final String text;
  final List<String> options;

  const DateLabel({
    super.key,
    required this.text,
    required this.options,
  });

  @override
  State<DateLabel> createState() => _DateLabelState();
}

class _DateLabelState extends State<DateLabel> {
  late String _currentText;

  @override
  void initState() {
    super.initState();
    _currentText = widget.text;
  }

  void _showOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Palette.artGold, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Set Genre',
                  style: TextStyle(
                    color: Palette.artGold,
                    fontSize: 20,
                    fontFamily: myFont.fontFamily,
                  ),
                ),
                const SizedBox(height: 16),
                ...widget.options.map((option) => ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: myFont.fontFamily,
                        ),
                      ),
                      onTap: () {
                        setState(() => _currentText = option);
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOptionsDialog,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.37, color: Colors.white),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(18.54),
              bottomRight: Radius.circular(5.56),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                _currentText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.25,
                  fontFamily: myFont.fontFamily,
                  fontWeight: FontWeight.w500,
                  height: 1.67,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                LucideIcons.chevronDown,
                color: Palette.artGold,
                size: 30,
              ),
              onPressed: _showOptionsDialog,
            ),
          ],
        ),
      ),
    );
  }
}
