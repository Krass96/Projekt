import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/383/151?grayscale"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
