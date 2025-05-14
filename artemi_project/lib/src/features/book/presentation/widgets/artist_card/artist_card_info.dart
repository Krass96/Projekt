import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArtistCardInfo extends StatelessWidget {
  final String name;
  final double rating;
  final String genre;
  final int price;

  const ArtistCardInfo({
    super.key,
    required this.name,
    required this.rating,
    required this.genre,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Palette.artGold)),
              Row(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  RatingBar.builder(
                    itemSize: 15,
                    initialRating: rating,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Palette.artGold),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    '(123)',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Genre: $genre',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('Price: $price€/h',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
