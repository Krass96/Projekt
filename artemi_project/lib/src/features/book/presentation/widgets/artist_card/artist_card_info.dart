import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArtistCardInfo extends StatefulWidget {
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
  State<ArtistCardInfo> createState() => _ArtistCardInfoState();
}

class _ArtistCardInfoState extends State<ArtistCardInfo> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Palette.artGold, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Text(
                    _currentRating.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  RatingBar.builder(
                    itemSize: 15,
                    initialRating: _currentRating,
                    minRating: 0,
                    allowHalfRating: true,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Palette.artGold),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _currentRating = rating;
                      });
                    },
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
              Text('Genre: ${widget.genre}',
                  style: Theme.of(context).textTheme.titleMedium),
              Text('Price: ${widget.price}€/h',
                  style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ],
    );
  }
}
