import 'package:flutter/material.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/my_app_bar.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  RangeValues values = const RangeValues(0, 10000);
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(title: 'My Events'),
      body: Column(
        children: [
          Divider(thickness: 2, color: Colors.white),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 375,
              perspective: 0.003,
              diameterRatio: 2.5,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return ArtistCard();
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
