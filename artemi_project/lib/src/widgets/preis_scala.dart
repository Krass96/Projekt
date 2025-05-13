import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';

class PreisScala extends StatefulWidget {
  final RangeValues values;
  final ValueChanged<RangeValues> onChanged;

  const PreisScala({
    super.key,
    required this.values,
    required this.onChanged,
  });

  @override
  State<PreisScala> createState() => _PreisScalaState();
}

class _PreisScalaState extends State<PreisScala> {
  late RangeValues _localValues;

  @override
  void initState() {
    super.initState();
    _localValues = widget.values;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Price',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold, color: Palette.artGold)),
        const SizedBox(height: 12),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            overlayColor: Palette.artGold,
            activeTrackColor: Palette.artGold,
            inactiveTrackColor: Colors.white24,
            thumbColor: Palette.artGold,
            trackHeight: 4,
            valueIndicatorColor: Palette.artGold,
            showValueIndicator: ShowValueIndicator.always,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 10,
            ),
          ),
          child: RangeSlider(
            values: _localValues,
            min: 0,
            max: 10000,
            divisions: 100,
            labels: RangeLabels(
              _formatValue(_localValues.start),
              _formatValue(_localValues.end),
            ),
            onChanged: (newValues) {
              setState(() {
                _localValues = newValues;
              });
              widget.onChanged(newValues);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("0", style: TextStyle(color: Colors.white70)),
              Text("2000 €", style: TextStyle(color: Colors.white70)),
              Text("4500 €", style: TextStyle(color: Colors.white70)),
              Text("7000 €", style: TextStyle(color: Colors.white70)),
              Text("10k €", style: TextStyle(color: Colors.white70)),
            ],
          ),
        )
      ],
    );
  }

  String _formatValue(double value) {
    return "${value.round()} €";
  }
}
