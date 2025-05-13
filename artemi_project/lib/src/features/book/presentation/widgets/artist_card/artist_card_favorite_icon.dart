import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';

class ArtistCardFavoriteIcon extends StatelessWidget {
  const ArtistCardFavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 15,
      child: Icon(Icons.favorite, color: Palette.artGold, size: 30),
    );
  }
}
