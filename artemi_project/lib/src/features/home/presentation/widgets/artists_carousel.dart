import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/artist_gallery_viewmodel.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card.dart';
import 'package:shimmer/shimmer.dart';

class ArtistCardCarousel extends StatefulWidget {
  const ArtistCardCarousel({super.key});

  @override
  State<ArtistCardCarousel> createState() => _ArtistCardCarouselState();
}

class _ArtistCardCarouselState extends State<ArtistCardCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  final viewModel = ArtistGalleryViewModel();

  late Future<List<ArtistCardDb>> _artistFuture;

  @override
  void initState() {
    super.initState();
    _artistFuture = _loadArtists();
  }

  Future<List<ArtistCardDb>> _loadArtists() async {
    await Future.delayed(Duration(seconds: 2));
    return MockDatabaseRepository().artists;
  }

  void toggleFavorite(List<ArtistCardDb> artists, int index) {
    setState(() {
      artists[index] = artists[index].copyWith(
        isFavorit: !artists[index].isFavorit,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArtistCardDb>>(
      future: _artistFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Shimmer.fromColors(
            baseColor: Palette.bitcoinOrange,
            highlightColor: Palette.artGold,
            child: CircularProgressIndicator(),
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text("Fehler beim Laden der Künstler."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("Keine Künstler gefunden."));
        }

        final artists = snapshot.data!;

        return Column(
          children: [
            CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 320,
                enlargeFactor: 0,
                viewportFraction: 0.85,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemCount: artists.length,
              itemBuilder: (context, index, realIndex) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    '/favorites',
                    arguments: artists[index],
                  ),
                  child: ArtistCard(
                    artist: artists[index],
                    onToggleFavorite: () => toggleFavorite(artists, index),
                    showBookAndDm: false,
                    filledFavIcon: false,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left,
                      size: 52, color: Palette.artGold),
                  onPressed: () {
                    setState(() {
                      viewModel.previous(artists.length);
                      _carouselController.previousPage();
                    });
                  },
                ),
                SizedBox(width: 20),
                ...List.generate(
                  artists.length,
                  (index) => Container(
                    width: 15,
                    height: 15,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Palette.artGold
                          : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.chevron_right,
                      size: 52, color: Palette.artGold),
                  onPressed: () {
                    setState(() {
                      viewModel.next(artists.length);
                      _carouselController.nextPage();
                    });
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
