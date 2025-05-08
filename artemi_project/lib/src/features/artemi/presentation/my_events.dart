import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/my_app_bar.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        bottomNavigationBar: NavBar(),
        appBar: MyAppBar(),
        body: Column(
          children: [
            Divider(
              thickness: 2,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            ArtistCard()
          ],
        ));
  }
}
