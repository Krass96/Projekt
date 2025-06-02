import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card_favorite_icon.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card_info.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/book_and_dm.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card_image.dart';

class ArtistCard extends StatelessWidget {
  final ArtistCardDb artist;
  final VoidCallback onToggleFavorite;
  final bool showBookAndDm;
  final bool filledFavIcon;

  const ArtistCard(
      {super.key,
      required this.artist,
      required this.onToggleFavorite,
      this.showBookAndDm = true,
      this.filledFavIcon = false});

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
              ArtistCardImage(imagePath: artist.profilePicUrl),
              ArtistCardFavoriteIcon(
                isFavorite: artist.isFavorit,
                onToggleFavorite: onToggleFavorite,
                useFilledIcon: filledFavIcon,
              ),
            ],
          ),
          ArtistCardInfo(
            name: artist.artistName,
            rating: artist.rating,
            genre: artist.genre.name.toString().toUpperCase()[0] +
                artist.genre.name.toString().substring(1),
            price: artist.price,
          ),
          if (showBookAndDm) BookAndDm(),
        ],
      ),
    );
  }
}
