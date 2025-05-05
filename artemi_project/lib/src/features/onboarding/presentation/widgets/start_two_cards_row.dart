import 'package:flutter/material.dart';

class StartTwoCardsRow extends StatelessWidget {
  const StartTwoCardsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          transform: Matrix4.identity()..rotateZ(0.09),
          width: 150,
          height: 170,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/artist_scene.png'),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(12.31),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Container(
            transform: Matrix4.identity()..rotateZ(-0.07),
            width: 150,
            height: 170,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/app_nutzer.png'),
                fit: BoxFit.fitHeight,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(12.31),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
