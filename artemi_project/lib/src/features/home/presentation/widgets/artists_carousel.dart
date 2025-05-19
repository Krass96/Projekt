import 'package:artemi_project/src/data/mock_database_repository.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/artist_gallery_viewmodel.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/buttons_row.dart';
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

  final List<ArtistCardDb> artists = MockDatabaseRepository().artists;

  void toggleFavorite(int index) {
    setState(() {
      artists[index].isFavorit = !artists[index].isFavorit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          options: CarouselOptions(
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: artists.length,
          itemBuilder: (context, index, realIndex) {
            return ArtistCard(
              height: 100,
              widht: 300,
              artist: artists[index],
              onToggleFavorite: () => toggleFavorite(index),
              showBookAndDm: false,
            );
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            artists.length,
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
        ),
        SizedBox(height: 20),
        ButtonsRow(
          onPrevious: () {
            setState(() {
              viewModel.previous(artists.length);
              _carouselController.previousPage();
            });
          },
          onNext: () {
            setState(() {
              viewModel.next(artists.length);
              _carouselController.nextPage();
            });
          },
          buttonColor: Palette.artGold,
        ),
      ],
    );
  }
}
