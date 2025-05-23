import 'package:flutter/material.dart';
import 'package:artemi_project/src/common/app_bar/back_chevron.dart';
import 'package:artemi_project/src/common/my_scaffold.dart';
import 'package:artemi_project/src/features/auth/presentation/login.dart';
import 'package:artemi_project/src/features/onboarding/presentation/start_two.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one_cards.dart';
import 'package:artemi_project/src/features/onboarding/presentation/widgets/start_one_scala.dart';
import 'package:artemi_project/src/common/my_button.dart';

class StartOne extends StatelessWidget {
  const StartOne({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackChevron(),
        actions: [
          StartOneScala(
            widthYellow: 150,
          ),
        ],
      ),
      body: Column(
        children: [
          Text(
              "Hey, are you looking for an artist for your event? Then you've come to the right place!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge),
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
            padding: const EdgeInsets.all(22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyButton(
                    width: 150,
                    text: 'Continue',
                    fontSize: 20,
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StartTwo(),
                          ),
                        )),
                TextButton(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
