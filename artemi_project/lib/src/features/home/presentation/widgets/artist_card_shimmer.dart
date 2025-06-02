import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:artemi_project/src/theme/palette.dart';

class ArtistCardShimmer extends StatelessWidget {
  const ArtistCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Shimmer
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            enlargeFactor: 0,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          itemCount: 3, // Zeige 3 Shimmer Cards
          itemBuilder: (context, index, realIndex) {
            return _buildShimmerCard();
          },
        ),
        SizedBox(
          height: 30,
        ),
        // Navigation Controls Shimmer
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left Arrow Shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
            const SizedBox(width: 20),

            // Dots Shimmer
            ...List.generate(
              3,
              (index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),

            // Right Arrow Shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShimmerCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Artist Image Shimmer
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Heart/Favorite Icon Shimmer
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Artist Info Section Shimmer
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Artist Name Shimmer
                      Container(
                        height: 20,
                        width: double.infinity * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),

                      // Rating Shimmer
                      Row(
                        children: [
                          Container(
                            height: 16,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 16,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),

                      // Genre and Price Shimmer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 14,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Container(
                            height: 14,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Alternative: Einfachere Shimmer Version mit deinen App-Farben
class ArtistCardShimmerCustom extends StatelessWidget {
  const ArtistCardShimmerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 320,
            enlargeFactor: 0,
            viewportFraction: 0.85,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Shimmer.fromColors(
                baseColor: Palette.bitcoinOrange.withOpacity(0.3),
                highlightColor: Palette.artGold.withOpacity(0.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 16),

        // Simple Navigation Shimmer
        Shimmer.fromColors(
          baseColor: Palette.bitcoinOrange.withOpacity(0.3),
          highlightColor: Palette.artGold.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              const SizedBox(width: 20),
              ...List.generate(
                3,
                (index) => Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
