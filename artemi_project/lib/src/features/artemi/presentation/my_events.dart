import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/text_field.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/my_app_bar.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:artemi_project/src/widgets/preis_scala.dart';
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: MyInputDecoration.styled(
                              context: context,
                              hintText: 'Event Start',
                              labelText: 'Start',
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: MyInputDecoration.styled(
                              context: context,
                              hintText: 'Event End',
                              labelText: 'End',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PreisScala(
                          values: values,
                          onChanged: (newValues) {
                            setState(() {
                              values = newValues;
                            });
                          }),
                    ),
                  ),
                  Button(
                    text: 'Book',
                    icon: Icons.bookmark_add_outlined,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                            title: Text(
                              'Success!',
                              style: TextStyle(color: Colors.white),
                            ),
                            content:
                                Image.asset('assets/images/book_popup.png'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK',
                                    style: TextStyle(color: Colors.amber)),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
