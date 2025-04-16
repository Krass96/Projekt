import 'package:artemi_project/src/features/artist_galery/galery/domain/artist_info.dart';
import 'package:artemi_project/src/theme/my_color.dart';
import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    super.key,
    required this.context,
    required this.imagePath,
    required this.artistName,
    required this.artistDescription,
  });

  final BuildContext context;
  final String imagePath;
  final String artistName;
  final String artistDescription;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primColor,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(color: primColor, width: 3),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: ArtistInfo(
                      artistName: artistName,
                      artistDescription: artistDescription,
                    ),
                  ),
                ),
              );
            },
            child: const Text(
              'Info',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
