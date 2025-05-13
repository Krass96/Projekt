import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/widgets/my_app_bar.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/cover_photo.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/widgets/text_field.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/date_label.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: MyAppBar(title: 'Profile'),
      bottomNavigationBar: const NavBar(),
      body: Column(
        children: [
          Divider(height: 10, thickness: 2, color: Colors.white),
          SizedBox(height: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CoverPhoto(),
              ProfileAvatar(
                width: 108,
                height: 108,
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    DateLabel(text: 'Genre'),
                    DateLabel(text: 'Time'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
