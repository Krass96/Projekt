import 'package:flutter/material.dart';

class PreisScala extends StatelessWidget {
  const PreisScala({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 556,
      height: 160,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 556,
              height: 160,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(52),
                ),
              ),
            ),
          ),
          Positioned(
            left: 236,
            top: 9,
            child: Text(
              'Price',
              style: TextStyle(
                color: const Color(0xFFFFEE32),
                fontSize: 36,
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: 41,
            top: 72,
            child: Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 3,
                    color: const Color(0xFFFFD100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 495,
            top: 72,
            child: Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 3,
                    color: const Color(0xFFFFD100),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 46,
            top: 118,
            child: Container(
              width: 470,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 80,
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      color: const Color(0xFFFFEE32),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      color: const Color(0xFFFFEE32),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    '100',
                    style: TextStyle(
                      color: const Color(0xFFFFEE32),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    '1000',
                    style: TextStyle(
                      color: const Color(0xFFFFEE32),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    '>10k',
                    style: TextStyle(
                      color: const Color(0xFFFFEE32),
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
