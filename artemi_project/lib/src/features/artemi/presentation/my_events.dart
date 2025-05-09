import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/my_app_bar.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  RangeValues values = const RangeValues(0, 10000);
  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(),
      body: Column(
        children: [
          Divider(thickness: 2, color: Colors.white),
          ArtistCard(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(thickness: 2, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      decoration: MyInputDecoration.styled(
                        context: context,
                        hintText: 'Enter your Event Title',
                        labelText: 'Event Title',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextField(
                      decoration: MyInputDecoration.styled(
                        suffixIcon: Icon(Icons.location_on),
                        context: context,
                        hintText: 'Enter your Event Location',
                        labelText: 'Event Location',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: TextField(
                      decoration: MyInputDecoration.styled(
                        context: context,
                        hintText: 'Event Start',
                        labelText: 'Start',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: TextField(
                      decoration: MyInputDecoration.styled(
                        context: context,
                        hintText: 'Event Start',
                        labelText: 'Start',
                      ),
                    ),
                  ),
                  Center(
                    child: RangeSlider(
                        activeColor: Palette.artGold,
                        inactiveColor: Palette.textColor,
                        min: 0,
                        max: 10000,
                        divisions: 100,
                        labels: labels,
                        values: values,
                        onChanged: (newValues) {
                          setState(() {
                            values = newValues;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
