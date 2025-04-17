import 'package:flutter/material.dart';

class StartOneScala extends StatelessWidget {
  final double widthYellow;

  const StartOneScala({
    super.key,
    required this.widthYellow,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
          child: Container(
            width: 300,
            height: 7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(69),
              ),
            ),
          ),
        ),
        Container(
          width: widthYellow,
          height: 7,
          decoration: ShapeDecoration(
              color: Color(0xFFFFEE32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(69),
              )),
        )
      ],
    );
  }
}
