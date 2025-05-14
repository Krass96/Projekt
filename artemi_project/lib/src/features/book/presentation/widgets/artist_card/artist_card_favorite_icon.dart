import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class ArtistCardFavoriteIcon extends StatelessWidget {
  const ArtistCardFavoriteIcon({
    super.key,
    required this.isFavorite,
  });

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: isFavorite
          ? Icon(Icons.favorite, color: Palette.artGold, size: 30)
          : Icon(Icons.favorite_border, color: Palette.artGold, size: 30),
    );
  }
}
