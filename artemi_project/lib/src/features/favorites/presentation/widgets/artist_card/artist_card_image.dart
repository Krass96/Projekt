import 'package:flutter/material.dart';

class ArtistCardImage extends StatelessWidget {
  final String? imagePath;

  const ArtistCardImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: imagePath != null
                ? AssetImage(imagePath!)
                : AssetImage('assets/images/music.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
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
