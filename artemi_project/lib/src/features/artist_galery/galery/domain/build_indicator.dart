import 'package:artemi_project/src/theme/my_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BuildIndicator extends StatelessWidget {
  const BuildIndicator({
    super.key,
    required this.activeIndex,
    required this.artists,
  });

  final int activeIndex;
  final List<Map<String, String>> artists;

  @override
  Widget build(BuildContext context) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: artists.length,
        effect: SlideEffect(
          activeDotColor: primColor,
          dotColor: Colors.grey,
          dotHeight: 18,
          dotWidth: 18,
        ),
      );
}
