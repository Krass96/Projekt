import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:artemi_project/src/theme/palette.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/artist_gallery_viewmodel.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/build_image.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/build_indicator.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/buttons_row.dart';
import 'package:artemi_project/src/features/artist_galery/galery/domain/constants.dart';

class ArtistGalery extends StatefulWidget {
  const ArtistGalery({super.key});

  @override
  State<ArtistGalery> createState() => _ArtistGaleryState();
}

class _ArtistGaleryState extends State<ArtistGalery> {
  final viewModel = ArtistGalleryViewModel();
  final CarouselSliderController controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.yellow,
            size: 35,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/dashboard');
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Artist Galery',
          style: TextStyle(
              color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
            thickness: 3,
            height: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  carouselController: controller,
                  options: CarouselOptions(
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        viewModel.activeIndex = index;
                      });
                    },
                    height: 400,
                    enlargeCenterPage: true,
                  ),
                  itemCount: artists.length,
                  itemBuilder: (context, index, realIndex) {
                    final artist = artists[index];
                    final imagePath = imagePaths[index];
                    return BuildImage(
                      context: context,
                      imagePath: imagePath,
                      artistName: artist['name']!,
                      artistDescription: artist['description']!,
                    );
                  },
                ),
                const SizedBox(height: 32),
                BuildIndicator(
                  activeIndex: viewModel.activeIndex,
                  artists: artists,
                ),
                const SizedBox(height: 32),
                ButtonsRow(
                  onPrevious: () {
                    setState(() {
                      viewModel.previous(artists.length);
                      controller.previousPage();
                    });
                  },
                  onNext: () {
                    setState(() {
                      viewModel.next(artists.length);
                      controller.nextPage();
                    });
                  },
                  buttonColor: Palette.artGold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
