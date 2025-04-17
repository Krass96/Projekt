import 'package:artemi_project/src/widgets/button.dart';
import 'package:artemi_project/src/widgets/start_one_cards.dart';
import 'package:artemi_project/src/widgets/start_one_scala.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class StartOne extends StatelessWidget {
  const StartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          LucideIcons.chevronLeft,
          color: Color(0xFFFFEE32),
          size: 40,
        ),
        actions: [
          StartOneScala(
            widthYellow: 150,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 394.94,
            height: 45.14,
            child: Text(
              "Hey, are you looking for an artist for your event? Then you've come to the right place!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFD6D6D6),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.41,
                letterSpacing: -0.44,
              ),
            ),
          ),
          SizedBox(height: 20),
          StartOneCards(
              title: 'Musik & Bands',
              image1: "https://picsum.photos/183/127",
              image2: "https://picsum.photos/183/127"),
          StartOneCards(
              title: 'Paint & Dance',
              image1: "https://picsum.photos/183/127",
              image2: "https://picsum.photos/183/127"),
          StartOneCards(
              title: 'Magic & Stand-Up',
              image1: "https://picsum.photos/183/127",
              image2: "https://picsum.photos/183/127"),
          StartOneCards(
              title: 'Magic & Stand-Up',
              image1: "https://picsum.photos/183/127",
              image2: "https://picsum.photos/183/127"),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Button(
                  text: 'Continue',
                  alignment: Alignment.bottomLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
