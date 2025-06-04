import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class ArtistCardFavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final bool useFilledIcon;

  const ArtistCardFavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onToggleFavorite,
    this.useFilledIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: IconButton(
        onPressed: onToggleFavorite,
        icon: Icon(
          useFilledIcon ? Icons.favorite : Icons.favorite_border,
          color: Palette.artGold,
          size: 30,
        ),
      ),
    );
  }
}
