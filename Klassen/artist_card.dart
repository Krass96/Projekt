enum categorys { Musiker, Maler, Komediant, Taenzer, Zauberer }

class ArtistCard {
  // Attribute
  final String? profilePicUrl;
  final String artistName;
  final categorys;
  final bool isFavorit;
  final double rating;
  final int price;

  // Konstruktor
  ArtistCard({
    this.profilePicUrl,
    required this.isFavorit,
    required this.categorys,
    required this.artistName,
    required this.rating,
    required this.price,
  });

  // Methode
  void showArtistName() {
    print(artistName);
  }

  void showPrice() {
    print(price);
  }

  void showCategorys() {
    print(categorys);
  }

  void showRating() {
    print(rating);
  }
}
