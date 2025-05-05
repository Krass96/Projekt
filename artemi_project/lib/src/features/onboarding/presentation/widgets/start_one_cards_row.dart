import 'package:flutter/material.dart';

class StartOneCardsRow extends StatelessWidget {
  const StartOneCardsRow({
    super.key,
    required this.image1,
    required this.image2,
  });

  final String image1;
  final String image2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 183.01,
          height: 127.20,
          decoration: ShapeDecoration(
            image: DecorationImage(
                image: AssetImage(image1),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.grey, BlendMode.saturation)),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(12.31),
            ),
          ),
        ),
        Container(
          width: 183.01,
          height: 127.20,
          decoration: ShapeDecoration(
            image: DecorationImage(
                image: AssetImage(image2),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.grey, BlendMode.saturation)),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(12.31),
            ),
          ),
        )
      ],
    );
  }
}
