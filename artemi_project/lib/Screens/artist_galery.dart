import 'package:artemi_project/config/my_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArtistGalery extends StatefulWidget {
  const ArtistGalery({super.key});

  @override
  State<ArtistGalery> createState() => _ArtistGaleryState();
}

class _ArtistGaleryState extends State<ArtistGalery> {
  int activeIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  final List<String> imagePaths = const [
    'assets/images/band.jpg',
    'assets/images/comedy.jpg',
    'assets/images/danc.jpg',
    'assets/images/magic.jpg',
    'assets/images/music.jpg',
    'assets/images/paint.jpg',
  ];

  Widget buildImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imagePaths.length,
      effect: SlideEffect(
        activeDotColor: primColor,
        dotColor: Colors.grey,
        dotHeight: 18,
        dotWidth: 18,
      ),
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: previous,
          child: const Icon(Icons.chevron_left, size: 32, color: primColor),
        ),
        const SizedBox(width: 32),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          onPressed: next,
          child: const Icon(Icons.chevron_right, size: 32, color: primColor),
        ),
      ],
    );
  }

  void next() {
    final nextIndex = (activeIndex + 1) % imagePaths.length;
    controller.animateToPage(nextIndex);
  }

  void previous() {
    final previousIndex =
        (activeIndex - 1 + imagePaths.length) % imagePaths.length;
    controller.animateToPage(previousIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Artist Galery',
          style: TextStyle(color: Colors.yellow, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
            thickness: 2,
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
                        activeIndex = index;
                      });
                    },
                    height: 400,
                    enlargeCenterPage: true,
                  ),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index, realIndex) {
                    return buildImage(imagePaths[index]);
                  },
                ),
                const SizedBox(height: 32),
                buildIndicator(),
                const SizedBox(height: 16),
                buildButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
