import '../features/profile/domain/user_profile.dart';
import '../features/favorites/domain/artist_card_db.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';

abstract class DatabaseRepository {
  // Benutzer CRUD
  Future<void> createUser(UserProfile user);
  Future<UserProfile> getUser(String id);
  Future<UserProfile> getUserByEmail(String email);
  Future<void> updateUser(UserProfile updatedUser);
  Future<void> deleteUser(String userId);

  // Künstlerprofil CRUD
  Future<void> createArtist(ArtistCardDb artist);
  Future<ArtistCardDb> getArtist(String artistId);
  Future<void> updateArtist(ArtistCardDb updatedArtist);
  Future<void> deleteArtist(String artistId);
}

void main() {
  MockDatabaseRepository mockDatabaseRepository = MockDatabaseRepository();

  // User erstellen und löschen Beispiel

  UserProfile a = UserProfile(
    userId: '111',
    userName: 'Krass',
    password: '0000',
    eMail: 'krass@web.com',
    genres: ['musik'],
    priceScala: 2000,
    status: ['Part Time'],
  );
  mockDatabaseRepository.createUser(a);
}
