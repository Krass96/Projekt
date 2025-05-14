import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card.dart';
import 'package:flutter/material.dart';

class ArtistCardsList extends StatelessWidget {
  final List<ArtistCardDb> artistDataList;

  const ArtistCardsList({super.key, required this.artistDataList});

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
            if (index < artistDataList.length) {
              return ArtistCard(
                  artist: artistDataList[index]); // ✅ Daten übergeben
            }
            return null;
          },
          childCount: artistDataList.length,
        ),
      ),
    );
  }
}
