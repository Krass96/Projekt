import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(
        title: 'My Events',
        action: ProfileAvatar(width: 40, height: 40),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  iconColor: Palette.artGold,
                  titleTextStyle: Theme.of(context).textTheme.headlineLarge,
                  leading: Icon(Icons.event),
                  title: Text('Event ${index + 1}'),
                  subtitle: Text('Event details here'),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
