import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_cards_list.dart';
import 'package:artemi_project/src/widgets/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/widgets/my_app_bar.dart';
import '../domain/artist_card_db.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  RangeValues values = const RangeValues(0, 10000);

  final mockDB = MockDatabaseRepository();

  @override
  Widget build(BuildContext context) {
    final List<ArtistCardDb> artists = getArtists();
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(
        title: 'Favorites',
        action: ProfileAvatar(width: 50, height: 50),
      ),
      body: Column(
        children: [
          Divider(thickness: 2, color: Colors.white),
          ArtistCardsList(artistDataList: artists),
        ],
      ),
    );
  }
}
