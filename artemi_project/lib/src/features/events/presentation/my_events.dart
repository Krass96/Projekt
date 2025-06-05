import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/events/presentation/widgets/event_data.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/features/events/presentation/widgets/event_create_overlay.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<Map<String, String>> _events = [];

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
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final repo = MockDatabaseRepository();
    final events = await repo.getEvents();
    setState(() {
      _events = events
          .map((e) => {'title': e.title, 'description': e.description})
          .toList();
    });
  }

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
          EventData(events: _events),
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
