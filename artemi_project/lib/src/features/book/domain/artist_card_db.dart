enum Categories { music, paint, comedy, dance, magic }

class ArtistCardDb {
  // Attribute
  final String? profilePicUrl;
  final String artistName;
  final Categories genre;
  final bool isFavorit;
  final double rating;
  final int price;

  // Konstruktor
  ArtistCardDb({
    this.profilePicUrl,
    required this.isFavorit,
    required this.genre,
    required this.artistName,
    required this.rating,
    required this.price,
  });

//    Methoden
  void showArtistName() {
    print('The artist name: ${artistName}');
  }

  void showPrice() {
    print('The price: ${price}');
  }

  void showRating() {
    print('The rating: ${rating}');
  }

  void checkFavorit() {
    if (isFavorit) {
      print('This artist is favorit');
    } else {
      print('This artist is not favorit');
    }
  }
}

// void showDetails() {
//   print('Profile Picture Url: $profilePicUrl');
//   print('Artist Name: $artistName');
//   print('Categories: $categories');
//   print('Is Favorit: $isFavorit');
//   print('Rating: $rating');
//   print('Price: $price');
// }
