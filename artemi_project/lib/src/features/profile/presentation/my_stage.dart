import 'package:flutter/material.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';
import 'package:artemi_project/src/widgets/my_app_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/widgets/preis_scala.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/genre_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/save_button.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/user_name.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/cover_photo.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/availability_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';

class MyStage extends StatefulWidget {
  final UserProfile? user;

  const MyStage({super.key, required this.user});

  @override
  State<MyStage> createState() => _MyStageState();
}

class _MyStageState extends State<MyStage> {
  final mockDB = MockDatabaseRepository();
  UserProfile? user;
  final bool _obscureText = true;
  String _selectedGenre = 'Genre';
  String _selectedAvailability = 'Status';
  RangeValues _priceRange = const RangeValues(0, 10000);

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  void _showGenreDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenreDialog(
          options: genres,
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
          options: status,
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
      appBar: MyAppBar(
        title: 'My Stage',
        action: SaveButton(),
      ),
      bottomNavigationBar: const NavBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                CoverPhoto(),
                Positioned(
                  top: 70,
                  left: 5,
                  child: ProfileAvatar(
                    width: 120,
                    height: 120,
                  ),
                ),
                Positioned(
                    top: 155,
                    left: 130,
                    child: UserName(
                      name: user?.userName ?? '',
                    )),
              ],
            ),
            SizedBox(height: 60),
            if (user != null)
              ProfileData(obscureText: _obscureText, user: user!),
            SizedBox(height: 10),
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: PreisScala(
                  values: _priceRange,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _priceRange = values;
                    });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
