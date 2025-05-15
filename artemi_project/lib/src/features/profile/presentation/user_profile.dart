import 'package:artemi_project/src/features/profile/presentation/widgets/availability_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/genre_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/user_name.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/widgets/my_app_bar.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/cover_photo.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final bool _obscureText = true;
  String _selectedGenre = 'Genre';
  String _selectedAvailability = 'Avaibility';

  final List<String> _genreOptions = [
    'Paint',
    'Music',
    'Dance',
    'Comedy',
    'Magic'
  ];
  final List<String> _availabilityOptions = [
    'Weekends',
    'Evenings',
    'Full-time',
    'Part-time'
  ];

  void _showGenreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenreDialog(
          options: _genreOptions,
          selectedOption: _selectedGenre,
          onSelect: (value) {
            setState(() {
              _selectedGenre = value;
            });
          },
        );
      },
    );
  }

  void _showAvailabilityDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AvailabilityDialog(
          options: _availabilityOptions,
          selectedOption: _selectedAvailability,
          onSelect: (value) {
            setState(() {
              _selectedAvailability = value;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: MyAppBar(title: 'Profile'),
      bottomNavigationBar: const NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(height: 10, thickness: 2, color: Colors.white),
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              CoverPhoto(),
              Positioned(
                top: 70,
                left: 5,
                child: ProfileAvatar(
                  width: 140,
                  height: 140,
                ),
              ),
              Positioned(top: 160, right: 80, child: UserName()),
            ],
          ),
          SizedBox(height: 90),
          ProfileData(obscureText: _obscureText),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GenreButton(
                    selectedGenre: _selectedGenre,
                    onTap: _showGenreDialog,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: AvailabilityButton(
                    selectedAvailability: _selectedAvailability,
                    onTap: _showAvailabilityDialog,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
