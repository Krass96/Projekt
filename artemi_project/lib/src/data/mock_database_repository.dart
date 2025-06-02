import 'package:artemi_project/src/data/database_repository.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/features/onboarding/domain/button.dart';
import 'package:artemi_project/src/features/profile/domain/user_profile.dart';

class MockDatabaseRepository implements DatabaseRepository {
  final List<UserProfile> _userList = [
    UserProfile(
        id: '1',
        userName: 'Varnaliev',
        password: '********',
        eMail: 'test@web.de',
        genres: ['Music'],
        status: ['Evenings'],
        priceScala: 1000),
  ];
  final List<ArtistCardDb> artists = [
    ArtistCardDb(
      artistId: '1',
      profilePicUrl: 'assets/images/paint.jpg',
      isFavorit: true,
      artistName: 'Leonardo',
      artistDescription: 'A master of the Renaissance',
      rating: 4.9,
      genre: Categories.paint,
      price: 800,
    ),
    ArtistCardDb(
      artistId: '2',
      profilePicUrl: 'assets/images/music.png',
      isFavorit: true,
      artistName: 'Mozart',
      artistDescription: 'A prolific and influential composer',
      rating: 4.3,
      genre: Categories.music,
      price: 1200,
    ),
    ArtistCardDb(
      artistId: '3',
      profilePicUrl: 'assets/images/comedy.jpg',
      isFavorit: true,
      artistName: 'Charlie',
      artistDescription: 'A stand-up comedian and actor',
      rating: 4.5,
      genre: Categories.paint,
      price: 100,
    ),
    ArtistCardDb(
      artistId: '4',
      profilePicUrl: 'assets/images/magic.jpg',
      isFavorit: true,
      artistName: 'Houdini',
      artistDescription: 'A famous magician and escapologist',
      rating: 3.5,
      genre: Categories.magic,
      price: 200,
    ),
    ArtistCardDb(
      artistId: '5',
      profilePicUrl: 'assets/images/danc.jpg',
      isFavorit: true,
      artistName: 'Sara',
      artistDescription: 'A talented dancer and choreographer',
      rating: 4.1,
      genre: Categories.dance,
      price: 500,
    ),
  ];
  final List<Button> buttons = [];

  @override
  Future<void> createUser(UserProfile appUser) async {
    await Future.delayed(Duration(seconds: 3));
    _userList.add(appUser);
  }

  @override
  Future<UserProfile> getUser(String id) async {
    await Future.delayed(Duration(seconds: 3));
    final user = _userList.firstWhere(
      (u) => u.id == id,
      orElse: () => throw Exception('Kein Benutzerprofil gefunden'),
    );
    return user;
  }

  @override
  Future<void> deleteUser(String userId) async {
    await Future.delayed(Duration(seconds: 3));
    _userList.removeWhere((user) => user.id == userId);
  }

  @override
  Future<void> createArtist(ArtistCardDb artist) async {
    await Future.delayed(Duration(seconds: 3));
    final exists = artists.any((a) => a.artistName == artist.artistName);
    if (!exists) {
      artists.add(artist);
    }
  }

  @override
  Future<void> deleteArtist(String artistId) async {
    await Future.delayed(Duration(seconds: 3));
    artists.removeWhere((artist) => artist.artistName == artistId);
  }

  @override
  Future<ArtistCardDb> getArtist(String artistId) async {
    await Future.delayed(Duration(seconds: 3));
    return artists.firstWhere((artist) => artist.artistId == artistId);
  }
}
