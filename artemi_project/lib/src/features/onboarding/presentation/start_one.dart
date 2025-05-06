import 'package:artemi_project/src/common/back_chevron.dart';
import 'package:artemi_project/src/common/my_bg_wrapper.dart';
import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:artemi_project/src/features/onboarding/presentation/start_two.dart';
import 'package:artemi_project/src/widgets/button.dart';
import 'package:artemi_project/src/widgets/start_one_cards.dart';
import 'package:artemi_project/src/widgets/start_one_scala.dart';
import 'package:flutter/material.dart';

class StartOne extends StatelessWidget {
  const StartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackChevron(),
        actions: [
          StartOneScala(
            widthYellow: 150,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
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
            SizedBox(height: 20),
            StartOneCards(
                title: 'Music & Band',
                image1: "assets/images/music.png",
                image2: "assets/images/band.jpg"),
            SizedBox(height: 10),
            StartOneCards(
                title: 'Paint & Dance',
                image1: "assets/images/paint.jpg",
                image2: "assets/images/danc.jpg"),
            SizedBox(height: 10),
            StartOneCards(
                title: 'Magic & Stand-Up',
                image1: "assets/images/magic.jpg",
                image2: "assets/images/comedy.jpg"),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      width: 150,
                      text: 'Continue',
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StartTwo(),
                            ),
                          )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
