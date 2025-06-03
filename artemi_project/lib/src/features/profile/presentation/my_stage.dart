import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/common/preis_scala.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/services/user_service.dart';
import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/user_name.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/save_button.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/cover_photo.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/genre_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/status_dialog.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';

class MyStage extends StatefulWidget {
  const MyStage({super.key});

  @override
  State<MyStage> createState() => _MyStageState();
}

class _MyStageState extends State<MyStage> {
  final mockDB = MockDatabaseRepository();
  final ImagePicker _picker = ImagePicker();
  final bool _obscureText = true;
  String _selectedGenre = 'Genre';
  String _selectedAvailability = 'Status';
  RangeValues _priceRange = const RangeValues(0, 10000);
  File? _profileImage;
  File? _coverImage;

  Future<void> _pickProfileImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
      // Hier könntest du das Bild auch in deine Datenbank/Cloud speichern
    }
  }

  Future<void> _pickCoverImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _coverImage = File(image.path);
      });
      // Hier könntest du das Bild auch in deine Datenbank/Cloud speichern
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeUserData();
  }

  void _initializeUserData() {
    final currentUser = UserService().currentUser;
    if (currentUser != null) {
      setState(() {
        _selectedGenre =
            currentUser.genres.isNotEmpty ? currentUser.genres.first : 'Genre';
        _selectedAvailability =
            currentUser.status.isNotEmpty ? currentUser.status.first : 'Status';
        _priceRange = RangeValues(0, currentUser.priceScala.toDouble());
      });
    }
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
        return StatusDialog(
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

  Future<void> _saveProfile() async {
    final currentUser = UserService().currentUser;
    if (currentUser != null) {
      try {
        final updatedUser = UserProfile(
          userId: currentUser.userId,
          userName: currentUser.userName,
          password: currentUser.password,
          eMail: currentUser.eMail,
          genres: _selectedGenre != 'Genre' ? [_selectedGenre] : [],
          status:
              _selectedAvailability != 'Status' ? [_selectedAvailability] : [],
          priceScala: _priceRange.end.toInt(),
        );

        // In Datenbank speichern
        await mockDB.updateUser(updatedUser);

        // UserService aktualisieren
        UserService().setCurrentUser(updatedUser);

        // Erfolgs-Nachricht anzeigen
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile successfully saved!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (error) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error when saving: $error'),
              backgroundColor: Palette.errorColor,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = UserService().currentUser;
    // Prüfen ob Benutzer eingeloggt ist
    if (currentUser == null) {
      return MyScaffold(
        appBar: MyAppBar(title: 'My Stage'),
        bottomNavigationBar: const NavBar(),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_off, size: 64, color: Palette.textColor),
              SizedBox(height: 16),
              Text(
                'No user logged in',
                style: TextStyle(fontSize: 18, color: Palette.textColor),
              ),
              SizedBox(height: 8),
              Text(
                'Please log in first',
                style: TextStyle(fontSize: 14, color: Palette.textColor),
              ),
            ],
          ),
        ),
      );
    }

    return MyScaffold(
      appBar: MyAppBar(
        title: 'My Stage',
        action: SaveButton(
          onPressed: () => _saveProfile(),
        ),
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
                _coverImage != null
                    ? Image.file(
                        _coverImage!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : const CoverPhoto(),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt_outlined,
                        color: Colors.white),
                    onPressed: _pickCoverImage,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 5,
                  child: Stack(
                    children: [
                      _profileImage != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: FileImage(_profileImage!),
                            )
                          : ProfileAvatar(width: 120, height: 120),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined,
                              color: Colors.white),
                          onPressed: _pickProfileImage,
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 155,
                    left: 130,
                    child: UserName(name: currentUser.userName)),
              ],
            ),
            const SizedBox(height: 60),
            ProfileData(obscureText: _obscureText, user: currentUser),
            const SizedBox(height: 10),
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
                const SizedBox(width: 20),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
