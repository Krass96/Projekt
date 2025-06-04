import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/nav_bar.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/common/app_bar/my_app_bar.dart';
import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/profile/presentation/widgets/profile_avatar.dart';
import 'package:artemi_project/src/features/favorites/presentation/widgets/artist_card/artist_cards_list.dart';

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
    final favoriteArtists =
        MockDatabaseRepository().artists.where((a) => a.isFavorit).toList();
    return MyScaffold(
      bottomNavigationBar: NavBar(),
      appBar: MyAppBar(
        title: 'Favorites',
        action: ProfileAvatar(width: 50, height: 50),
      ),
      body: Column(
        children: [
          ArtistCardsList(artistDataList: favoriteArtists),
        ],
      ),
    );
  }
}
