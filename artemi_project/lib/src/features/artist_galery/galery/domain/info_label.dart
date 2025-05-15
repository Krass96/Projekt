import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class InfoLabel extends StatefulWidget {
  final String text;
  final List<String> options;

  const InfoLabel({
    super.key,
    required this.text,
    required this.options,
  });

  @override
  State<InfoLabel> createState() => _InfoLabelState();
}

class _InfoLabelState extends State<InfoLabel> {
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
                Text('Set Genre',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 16),
                ...widget.options.map((option) => ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          color: Colors.white,
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
              child: Text(_currentText,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white)),
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
