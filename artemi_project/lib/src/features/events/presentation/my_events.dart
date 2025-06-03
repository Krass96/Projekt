import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/features/events/presentation/widgets/event_create_overlay.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  final List<Map<String, String>> _events = [];

  Future<void> _showEventOverlay() async => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) => EventCreateOverlay(
          onCreate: (title, description) {
            setState(() {
              _events.add({
                'title': title,
                'description': description,
              });
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(
        title: 'My Events',
        action: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed('/mystage'),
            child: ProfileAvatar(width: 40, height: 40)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
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
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: FloatingActionButton(
              tooltip: 'Add event',
              backgroundColor: Palette.artGold,
              onPressed: _showEventOverlay,
              child: const Icon(
                Icons.add,
                color: Color(0xDD000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
