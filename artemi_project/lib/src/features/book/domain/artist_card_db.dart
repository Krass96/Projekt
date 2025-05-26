enum Categories { music, paint, comedy, dance, magic }

class ArtistCardDb {
  // Attribute
  final String? profilePicUrl;
  final String artistName;
  final Categories genre;
  final bool isFavorit;
  final double rating;
  final int price;
  final String artistDescription;

  // Konstruktor
  ArtistCardDb({
    this.profilePicUrl,
    required this.isFavorit,
    required this.genre,
    required this.artistName,
    required this.rating,
    required this.price,
    required this.artistDescription,
  });

  ArtistCardDb copyWith({
    String? profilePicUrl,
    bool? isFavorit,
    String? artistDescription,
    String? artistName,
    double? rating,
    Categories? genre,
    int? price,
  }) {
    return ArtistCardDb(
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      isFavorit: isFavorit ?? this.isFavorit,
      artistName: artistName ?? this.artistName,
      rating: rating ?? this.rating,
      genre: genre ?? this.genre,
      price: price ?? this.price,
      artistDescription: artistDescription ?? this.artistDescription,
    );
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

List<ArtistCardDb> getArtists() {
  return [
    ArtistCardDb(
      profilePicUrl: 'assets/images/paint.jpg',
      isFavorit: false,
      artistName: 'Leonardo',
      rating: 4.9,
      genre: Categories.paint,
      price: 800,
      artistDescription: 'A master of the Renaissance',
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/music.png',
      isFavorit: false,
      artistName: 'Mozart',
      rating: 4.3,
      genre: Categories.music,
      price: 1200,
      artistDescription: 'A prolific and influential composer',
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/comedy.jpg',
      isFavorit: false,
      artistName: 'Charlie',
      artistDescription: 'A stand-up comedian and actor',
      rating: 4.5,
      genre: Categories.paint,
      price: 100,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/magic.jpg',
      isFavorit: false,
      artistName: 'Houdini',
      artistDescription: 'A famous magician and escapologist',
      rating: 3.5,
      genre: Categories.magic,
      price: 200,
    ),
    ArtistCardDb(
      profilePicUrl: 'assets/images/danc.jpg',
      isFavorit: false,
      artistName: 'Sara',
      artistDescription: 'A talented dancer and choreographer',
      rating: 4.1,
      genre: Categories.dance,
      price: 500,
    ),
  ];
}
