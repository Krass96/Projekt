import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final double height;

  const ProfileAvatar({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -54.10,
      left: MediaQuery.of(context).size.width / 2 - 54.10,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFFFEE32),
            width: 3,
          ),
          image: const DecorationImage(
            image: AssetImage('assets/images/my_portre.png'),
          ),
        ),
      ),
    );
  }
}
