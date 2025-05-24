import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class ArtistCardFavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const ArtistCardFavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite_border : Icons.favorite,
          color: Palette.artGold,
          size: 30,
        ),
        onPressed: onToggleFavorite,
      ),
    );
  }
}
