import 'package:flutter/material.dart';

class SearchArtistBar extends StatelessWidget {
  const SearchArtistBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search),
      hintText: 'Find your Artist',
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
    );
  }
}
