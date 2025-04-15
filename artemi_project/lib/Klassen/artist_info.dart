import 'package:artemi_project/config/my_color.dart';
import 'package:flutter/material.dart';

class ArtistInfo extends StatelessWidget {
  final String artistName;
  final String artistDescription;

  const ArtistInfo({
    super.key,
    required this.artistName,
    required this.artistDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  artistName,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primColor),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                artistDescription,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Close',
                    style: TextStyle(color: primColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
