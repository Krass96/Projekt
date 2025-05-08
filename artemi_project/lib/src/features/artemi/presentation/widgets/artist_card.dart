import 'package:artemi_project/src/features/artist_galery/main_screen.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.matrix(<double>[
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    child: Image.asset(
                      'assets/images/music.png',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Icon(Icons.favorite, color: Palette.artGold, size: 24),
              ),
            ],
          ),
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
                RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3.5,
                    itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Palette.artGold,
                        ),
                    onRatingUpdate: (rating) {})
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Genre: Dance 💃',
                    style: Theme.of(context).textTheme.titleMedium),
                Text('Price: 200 € 💰',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Palette.artGold,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    ),
                  ),
                  icon: Icon(
                    Icons.event,
                    size: 30,
                    color: Palette.artGold,
                  ),
                  label: Text(
                    'Book',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Container(width: 1, height: 40, color: Colors.white),
              Expanded(
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Palette.artGold,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.chat,
                    size: 30,
                    color: Palette.artGold,
                  ),
                  label: Text(
                    'DM',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
