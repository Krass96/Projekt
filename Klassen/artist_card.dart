enum categories { Musiker, Maler, Komediant, Taenzer, Zauberer }

class ArtistCard {
  // Attribute
  final String? profilePicUrl;
  final String artistName;
  final categories;
  final bool isFavorit;
  final double rating;
  final int price;

  // Konstruktor
  ArtistCard({
    this.profilePicUrl,
    required this.isFavorit,
    required this.categories,
    required this.artistName,
    required this.rating,
    required this.price,
  });

  // Methode
  void showArtistName() {
    print('The artist name: ${artistName}');
  }

  void showPrice() {
    print('The price: ${price}');
  }

  void showRating() {
    print('The rating: ${rating}');
  }
}
