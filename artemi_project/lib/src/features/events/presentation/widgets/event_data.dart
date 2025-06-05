import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class EventData extends StatelessWidget {
  const EventData({
    super.key,
    required List<Map<String, String>> events,
  }) : _events = events;

  final List<Map<String, String>> _events;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                iconColor: Palette.artGold,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                leading: const Icon(Icons.event),
                title: Text(event['title'] ?? ''),
                subtitle: Text(
                  event['description'] ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontStyle: FontStyle.italic),
                ),
                onTap: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
