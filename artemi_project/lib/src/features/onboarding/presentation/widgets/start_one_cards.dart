import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one_cards_row.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one_cards_title.dart';
import 'package:flutter/material.dart';

class StartOneCards extends StatelessWidget {
  final String title;
  final String image1;
  final String image2;

  const StartOneCards(
      {super.key,
      required this.title,
      required this.image1,
      required this.image2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StartOneCardsTitle(title: title),
        StartOneCardsRow(image1: image1, image2: image2)
      ],
    );
  }
}
