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
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFFFEE32),
          width: 2,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/my_portre.png'),
        ),
      ),
    );
  }
}
