import 'artist_card.dart';
import 'button.dart';
import 'user_profile.dart';

abstract class DatabaseRepository {
  // Benutzer erstellen und löschen
  void createUser(UserProfile user);
  void deleteUser(String userId);

  // Künstlerprofil erstellen und löschen
  void createArtist(ArtistCard artist);
  void deleteArtist(String artistId);

  // Button-Aktionen speichern und löschen
  void saveButtonAction(Button button);
  void deleteButtonAction(String buttonId);
}

class MockDatabaseRepository implements DatabaseRepository {
  List<UserProfile> users = [];
  List<ArtistCard> artists = [];
  List<Button> buttons = [];

  @override
  void createUser(UserProfile user) {
    users.add(user);
    print("User ${user.userName} wurde erstellt.");
  }

  @override
  void deleteUser(String userId) {
    users.removeWhere((user) => user.eMail == userId);
    print("User mit der ID $userId wurde gelöscht.");
  }

  @override
  void createArtist(ArtistCard artist) {
    artists.add(artist);
    print("Artist ${artist.artistName} wurde erstellt.");
  }

  @override
  void deleteArtist(String artistId) {
    artists.removeWhere((artist) => artist.artistName == artistId);
    print("Artist mit der ID $artistId wurde gelöscht.");
  }

  @override
  void saveButtonAction(Button button) {
    buttons.add(button);
    print("Button '${button.text}' wurde gespeichert.");
  }

  @override
  void deleteButtonAction(String buttonId) {
    buttons.removeWhere((button) => button.text == buttonId);
    print("Button mit der ID $buttonId wurde gelöscht.");
  }
}
