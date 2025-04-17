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
        SizedBox(
          width: 202.0,
          height: 32.83,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFFEE32),
              fontSize: 23.45,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.33,
              letterSpacing: -0.36,
            ),
          ),
        ),
        Row(
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
        )
      ],
    );
  }
}
