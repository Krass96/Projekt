import '../features/book/domain/artist_card_db.dart';
import '../features/onboarding/domain/button.dart';
import '../features/profile/domain/user_profile.dart';

abstract class DatabaseRepository {
  // Benutzer erstellen und löschen
  void createUser(UserProfile user);
  void deleteUser(String userId);

  // Künstlerprofil erstellen und löschen
  void createArtist(ArtistCardDb artist);
  void deleteArtist(String artistId);

  // Button-Aktionen speichern und löschen
  void saveButtonAction(Button button);
  void deleteButtonAction(String buttonId);
}

class MockDatabaseRepository implements DatabaseRepository {
  List<UserProfile> users = [];
  List<ArtistCardDb> artists = [];
  List<Button> buttons = [];

  @override
  void createUser(UserProfile user) {
    users.add(user);
  }

  @override
  void deleteUser(String userId) {
    users.removeWhere((user) => user.eMail == userId);
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

  @override
  void saveButtonAction(Button button) {
    buttons.add(button);
  }

  @override
  void deleteButtonAction(String buttonId) {
    buttons.removeWhere((button) => button.text == buttonId);
  }
}

void main() {
  MockDatabaseRepository mockDatabaseRepository = MockDatabaseRepository();

  // User erstellen und löschen

  UserProfile a = UserProfile(
    userName: 'Krass',
    password: '0000',
    eMail: 'krass@web.com',
    genre: 'musik',
    priceScala: 2000,
    date: DateTime.now(),
  );
  mockDatabaseRepository.createUser(a);
}
