import 'package:artemi_project/src/features/book/domain/artist_card_db.dart';
import 'package:flutter/material.dart';

class SearchArtistBar extends StatelessWidget {
  const SearchArtistBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ArtistCardDb> allArtists = getArtists();

    return SearchAnchor.bar(
      barHintText: 'Find your Artist',
      barLeading: const Icon(Icons.search),
      barBackgroundColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.surface,
      ),
      suggestionsBuilder: (context, controller) {
        final query = controller.text.toLowerCase();
        final results = allArtists
            .where((artist) => artist.artistName.toLowerCase().contains(query))
            .toList();
        return results.map((artist) {
          return ListTile(
            leading: artist.profilePicUrl != null
                ? CircleAvatar(
                    backgroundImage: AssetImage(artist.profilePicUrl!),
                  )
                : null,
            title: Text(artist.artistName),
            onTap: () {
              controller.text = artist.artistName;
            },
          );
        }).toList();
      },
    );
  }
}
