import '../features/profile/domain/user_profile.dart';
import '../features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';

abstract class DatabaseRepository {
  // Benutzer erstellen und löschen
  void createUser(UserProfile user);
  UserProfile getUser(String id);
  void deleteUser(String userId);

  // Künstlerprofil erstellen und löschen
  void createArtist(ArtistCardDb artist);
  void deleteArtist(String artistId);
}

void main() {
  MockDatabaseRepository mockDatabaseRepository = MockDatabaseRepository();

  // User erstellen und löschen

  UserProfile a = UserProfile(
    id: '111',
    userName: 'Krass',
    password: '0000',
    eMail: 'krass@web.com',
    genres: ['musik'],
    priceScala: 2000,
    status: ['Part Time'],
  );
  mockDatabaseRepository.createUser(a);
}
