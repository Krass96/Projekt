import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String text;

  const MyTextField({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 386.75,
      height: 90,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 25,
            child: Container(
              width: 383.29,
              height: 56.40,
              padding: const EdgeInsets.symmetric(
                horizontal: 28.78,
                vertical: 18.42,
              ),
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.15, color: Colors.white),
                  borderRadius: BorderRadius.circular(23.02),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xFFADADAD),
                      fontSize: 14.96,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.02,
                      letterSpacing: -0.18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 0,
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFFFFEE32),
                fontSize: 14.96,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 1.02,
                letterSpacing: -0.18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
