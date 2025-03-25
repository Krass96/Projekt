import 'artist_card.dart';
import 'button.dart';
import 'user_profile.dart';

abstract class DatabaseRepository {
  // Benutzerverwaltung
  void createUser(UserProfile user);
  UserProfile? readUser(String userName);
  void updateUser(String userName, UserProfile updatedUser);
  void deleteUser(String userName);

  // Künstlerverwaltung
  void createArtist(ArtistCard artist);
  ArtistCard? readArtist(String artistName);
  void updateArtist(String artistName, ArtistCard updatedArtist);
  void deleteArtist(String artistName);

  // Favoriten abrufen
  List<ArtistCard> getFavoriteArtists();

  // Button-Interaktionen
  void logButtonPress(Button button);
  List<Button> getPressedButtons();
}

class MockDatabaseRepository implements DatabaseRepository {
  List<UserProfile> users = [];
  List<ArtistCard> artists = [];
  List<Button> pressedButtons = [];

  @override
  void createUser(UserProfile user) => users.add(user);

  @override
  UserProfile? readUser(String userName) {
    for (var user in users) {
      if (user.userName == userName) {
        return user;
      }
    }
    return null;
  }

  @override
  void updateUser(String userName, UserProfile updatedUser) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].userName == userName) {
        users[i] = updatedUser;
        return;
      }
    }
  }

  @override
  void deleteUser(String userName) =>
      users.removeWhere((user) => user.userName == userName);

  @override
  void createArtist(ArtistCard artist) => artists.add(artist);

  @override
  ArtistCard? readArtist(String artistName) {
    for (ArtistCard artist in artists) {
      if (artist.artistName == artistName) {
        return artist;
      }
    }
    return null;
  }

  @override
  void updateArtist(String artistName, ArtistCard updatedArtist) {
    for (int i = 0; i < artists.length; i++) {
      if (artists[i].artistName == artistName) {
        artists[i] = updatedArtist;
        return;
      }
    }
  }

  @override
  void deleteArtist(String artistName) {
    for (int i = 0; i < artists.length; i++) {
      if (artists[i].artistName == artistName) {
        artists.removeAt(i);
        return;
      }
    }
  }

  @override
  List<ArtistCard> getFavoriteArtists() {
    List<ArtistCard> favoriteArtists = [];
    for (ArtistCard artist in artists) {
      if (artist.isFavorit) {
        favoriteArtists.add(artist);
      }
    }
    return favoriteArtists;
  }

  @override
  void logButtonPress(Button button) => pressedButtons.add(button);

  @override
  List<Button> getPressedButtons() => pressedButtons;
}
