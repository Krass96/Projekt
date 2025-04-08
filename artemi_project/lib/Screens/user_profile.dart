import 'package:artemi_project/Klassen/date_label.dart';
import 'package:artemi_project/Klassen/nav_bar.dart';
import 'package:artemi_project/Klassen/text_field.dart';
import 'package:artemi_project/config/my_color.dart';
import 'package:artemi_project/config/my_font.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavBar(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Profile'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: myFont.fontFamily,
          ),
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(LucideIcons.chevronLeft, color: primColor, size: 36),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(LucideIcons.save, color: primColor, size: 30),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Divider(height: 10, thickness: 2, color: Colors.white),
            SizedBox(height: 10),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/383/151?grayscale"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -54.10,
                  left: MediaQuery.of(context).size.width / 2 - 54.10,
                  child: Container(
                    width: 108.20,
                    height: 108.20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFFFEE32),
                        width: 5.90,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/my_portre.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTextField(title: 'Username', text: 'testUser'),
                MyTextField(title: 'Email', text: 'test@gmail.com'),
                MyTextField(title: 'Password', text: '********'),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateLabel(text: 'Genre'),
                      DateLabel(text: 'Time'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
