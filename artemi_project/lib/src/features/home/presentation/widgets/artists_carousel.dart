import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/artist_gallery_viewmodel.dart';
import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:artemi_project/src/features/book/presentation/widgets/artist_card/artist_card.dart';

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

  final List<ArtistCardDb> _artists = MockDatabaseRepository().artists;

  void toggleFavorite(int index) {
    setState(() {
      _artists[index] = _artists[index].copyWith(
        isFavorit: !_artists[index].isFavorit,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 318,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: _artists.length,
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                '/favorites',
                arguments: _artists[index],
              ),
              child: ArtistCard(
                artist: _artists[index],
                onToggleFavorite: () => toggleFavorite(index),
                showBookAndDm: false,
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
                  viewModel.previous(_artists.length);
                  _carouselController.previousPage();
                });
              },
            ),
            SizedBox(
              width: 20,
            ),
            ...List.generate(
              _artists.length,
              (index) => Container(
                width: 15,
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Palette.artGold : Colors.grey,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right,
                  size: 52, color: Palette.artGold),
              onPressed: () {
                setState(() {
                  viewModel.next(_artists.length);
                  _carouselController.nextPage();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
