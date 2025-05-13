import 'package:flutter/material.dart';

class ArtistCardImage extends StatelessWidget {
  const ArtistCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/music.png'),
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(12.31),
          ),
        ),
      ),
    );
  }
}
