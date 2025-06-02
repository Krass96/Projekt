import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card.dart';

class ArtistCardsList extends StatefulWidget {
  final List<ArtistCardDb> artistDataList;

  const ArtistCardsList({super.key, required this.artistDataList});

  @override
  State<ArtistCardsList> createState() => _ArtistCardsListState();
}

class _ArtistCardsListState extends State<ArtistCardsList> {
  late List<ArtistCardDb> _artists;

  @override
  void initState() {
    super.initState();
    _artists = List.from(widget.artistDataList);
  }

  void toggleFavorite(int index) {
    setState(() {
      _artists[index] = _artists[index].copyWith(
        isFavorit: !_artists[index].isFavorit,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        itemExtent: 375,
        perspective: 0.003,
        diameterRatio: 2.5,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final artist = _artists[index];
            return ArtistCard(
              artist: artist,
              onToggleFavorite: () => toggleFavorite(index),
              filledFavIcon: true,
            );
          },
          childCount: _artists.length,
        ),
      ),
    );
  }
}
