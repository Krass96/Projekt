import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/features/onboarding/domain/button.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final List<UserProfile> _userList = [];
  final List<ArtistCardDb> artists = [
    ArtistCardDb(
      profilePicUrl: 'assets/images/paint.jpg',
      isFavorit: true,
      artistName: 'Leonardo',
      rating: 4.9,
      genre: Categories.paint,
      price: 800,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/music.png',
      isFavorit: true,
      artistName: 'Mozart',
      rating: 4.3,
      genre: Categories.music,
      price: 1200,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/comedy.jpg',
      isFavorit: true,
      artistName: 'Charlie',
      rating: 4.5,
      genre: Categories.paint,
      price: 100,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/magic.jpg',
      isFavorit: true,
      artistName: 'Houdini',
      rating: 3.5,
      genre: Categories.magic,
      price: 200,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/danc.jpg',
      isFavorit: true,
      artistName: 'Sara',
      rating: 4.1,
      genre: Categories.dance,
      price: 500,
    ),
  ];
  final List<Button> buttons = [];

  @override
  void createUser(UserProfile appUser) {
    _userList.add(appUser);
  }

  @override
  UserProfile getUser(String id) {
    return _userList.firstWhere((user) => user.id == id);
  }

  @override
  void deleteUser(String userId) {
    _userList.removeWhere((user) => user.id == userId);
  }

  @override
  void createArtist(ArtistCardDb artist) {
    final exists = artists.any((a) => a.artistName == artist.artistName);
    if (!exists) {
      artists.add(artist);
    }
  }

  @override
  void deleteArtist(String artistId) {
    artists.removeWhere((artist) => artist.artistName == artistId);
  }
}
