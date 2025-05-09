import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card_favorite_icon.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card_info.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/book_and_dm.dart';
import 'package:artemi_project/src/features/artemi/presentation/widgets/artist_card_image.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Stack(
            children: [
              ArtistCardImage(),
              ArtistCardFavoriteIcon(),
            ],
          ),
          ArtistCardInfo(),
          const Divider(color: Colors.white),
          BookAndDm(),
        ],
      ),
    );
  }
}
