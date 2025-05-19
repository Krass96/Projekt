import 'package:flutter/material.dart';

class SearchArtistBar extends StatelessWidget {
  const SearchArtistBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barHintText: 'Find your Artist',
      barLeading: const Icon(Icons.search),
      barBackgroundColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.surface,
      ),
      suggestionsBuilder: (context, controller) {
        final query = controller.text.toLowerCase();
        final allArtists = [
          'Varnaliev',
          'Luna Lumen',
          'DJ Nova',
          'Mister Magic',
          'Karma Kicks'
        ];
        final results = allArtists
            .where((artist) => artist.toLowerCase().contains(query))
            .toList();

        return results.map((artist) {
          return ListTile(
            title: Text(artist),
            onTap: () {
              controller.text = artist;
            },
          );
        }).toList();
      },
    );
  }
}
