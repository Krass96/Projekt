import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArtistCardInfo extends StatelessWidget {
  const ArtistCardInfo({
    super.key,
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
              Text('Lorem Ipsum',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Palette.artGold)),
              Row(
                spacing: 6,
                children: [
                  Text(
                    '4.0',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  RatingBar.builder(
                      itemSize: 15,
                      initialRating: 3.5,
                      itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Palette.artGold,
                          ),
                      onRatingUpdate: (rating) {}),
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
              Text('Genre: Music',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('Price:  200€/h',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
