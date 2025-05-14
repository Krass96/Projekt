import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/booking_overlay/artist_cards_list.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/widgets/my_app_bar.dart';
import '../../../data/database_repository.dart';
import '../domain/artist_card_db.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  RangeValues values = const RangeValues(0, 10000);

  final mockDB = MockDatabaseRepository();

  List<ArtistCardDb> getArtists() {
    mockDB.createArtist(ArtistCardDb(
      profilePicUrl: 'assets/images/paint.jpg',
      isFavorit: true,
      artistName: 'Leonardo',
      rating: 4.9,
      genre: Categories.paint,
      price: 800,
    ));

    mockDB.createArtist(ArtistCardDb(
      profilePicUrl: 'assets/images/music.png',
      isFavorit: true,
      artistName: 'Mozart',
      rating: 4.3,
      genre: Categories.music,
      price: 1200,
    ));

    mockDB.createArtist(ArtistCardDb(
      profilePicUrl: 'assets/images/comedy.jpg',
      isFavorit: true,
      artistName: 'Charlie',
      rating: 4.5,
      genre: Categories.paint,
      price: 100,
    ));

    mockDB.createArtist(ArtistCardDb(
      profilePicUrl: 'assets/images/magic.jpg',
      isFavorit: true,
      artistName: 'Houdini',
      rating: 3.5,
      genre: Categories.magic,
      price: 200,
    ));

    mockDB.createArtist(ArtistCardDb(
      profilePicUrl: 'assets/images/danc.jpg',
      isFavorit: true,
      artistName: 'Sara',
      rating: 4.1,
      genre: Categories.dance,
      price: 500,
    ));

    return mockDB.artists;
  }

  @override
  Widget build(BuildContext context) {
    final List<ArtistCardDb> artists = getArtists();

    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(title: 'Favorites'),
      body: Column(
        children: [
          Divider(thickness: 2, color: Colors.white),
          SizedBox(height: 10),
          ArtistCardsList(artistDataList: artists),
        ],
      ),
    );
  }
}
