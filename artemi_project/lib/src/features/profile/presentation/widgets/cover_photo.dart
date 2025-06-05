import 'package:flutter/material.dart';

class CoverPhoto extends StatelessWidget {
  const CoverPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: DecorationImage(
          image: NetworkImage("https://picsum.photos/383/151?grayscale"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
