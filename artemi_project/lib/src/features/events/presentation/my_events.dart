import 'package:flutter/material.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/events/domain/events.dart';
import 'package:artemi_project/src/features/events/presentation/widgets/event_data.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  Future<List<Event>> _loadEvents() async {
    final repo = MockDatabaseRepository();
    return await repo.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(
        title: 'My Events',
        action: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/mystage'),
          child: ProfileAvatar(width: 40, height: 40),
        ),
      ),
      body: FutureBuilder<List<Event>>(
        future: _loadEvents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Palette.artGold,
            ));
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading the events"));
          }

          final events = snapshot.data ?? [];

          if (events.isEmpty) {
            return const Center(
                child: Text(
              "I'm really sorry, but I can't find any events. 💁",
              style: TextStyle(fontSize: 16),
            ));
          }

          return EventData(events: events);
        },
      ),
    );
  }
}
