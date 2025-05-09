import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class PreisScala extends StatefulWidget {
  const PreisScala({super.key});

  @override
  State<PreisScala> createState() => _PreisScalaState();
}

class _PreisScalaState extends State<PreisScala> {
  RangeValues values = const RangeValues(0, 10000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Price',
          style: TextStyle(
            color: Palette.artGold,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RangeSlider(
          values: values,
          min: 0,
          max: 10000,
          divisions: 5,
          activeColor: Palette.artGold,
          inactiveColor: Colors.white24,
          labels: RangeLabels(
            values.start.round().toString(),
            values.end.round().toString(),
          ),
          onChanged: (newValues) {
            setState(() {
              values = newValues;
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('0', style: TextStyle(color: Colors.white)),
            Text('10', style: TextStyle(color: Colors.white)),
            Text('100', style: TextStyle(color: Colors.white)),
            Text('1000', style: TextStyle(color: Colors.white)),
            Text('>10k', style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}
