import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card.dart';
import 'package:flutter/material.dart';

class ArtistCardsList extends StatelessWidget {
  const ArtistCardsList({
    super.key,
  });

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
            return ArtistCard();
          },
          childCount: 10,
        ),
      ),
    );
  }
}
