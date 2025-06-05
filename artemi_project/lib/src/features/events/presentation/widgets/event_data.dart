import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:artemi_project/src/features/events/domain/events.dart';
import 'package:artemi_project/src/theme/palette.dart';

class EventData extends StatelessWidget {
  final List<Event> events;

  const EventData({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            "I'm really sorry, but I can't find any events. 🤷🏻‍♂️",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        final day = DateFormat('d').format(event.start);
        final month = DateFormat('MMM').format(event.start).toUpperCase();
        final time = DateFormat('hh:mm a').format(event.start);

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 100,
                decoration: BoxDecoration(
                  color: Palette.artGold,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      month,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      day,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Expanded(
                    child: Row(
                      spacing: 12,
                      children: [
                        Image.asset(
                          'assets/images/music.png',
                          width: 100,
                          colorBlendMode: BlendMode.saturation,
                        ),
                        Column(
                          spacing: 12,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                const Icon(Icons.access_time,
                                    size: 18, color: Colors.white),
                                Text(
                                  time,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 18,
                                ),
                                Text(
                                  event.location,
                                  style: Theme.of(context).textTheme.labelLarge,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
