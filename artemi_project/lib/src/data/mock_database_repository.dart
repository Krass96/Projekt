import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/features/onboarding/domain/button.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final List<UserProfile> _userList = [];
  final List<ArtistCardDb> artists = [];
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
