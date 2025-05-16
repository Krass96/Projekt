class UserProfile {
  // Attribute
  final String id;
  final String? coverImageUrl;
  final String? profilImageUrl;
  final String userName;
  final String password;
  final String eMail;
  final String genre;
  final int date = DateTime.now().year;
  final int priceScala;

  // Konstruktor
  UserProfile({
    this.coverImageUrl,
    this.profilImageUrl,
    required this.id,
    required this.userName,
    required this.password,
    required this.eMail,
    required this.genre,
    required this.priceScala,
    required DateTime date,
  });

  // Methode(n)
  // void showUserName() {
  //   print('User name: $userName');
  // }

  // void showEmail() {
  //   print('Email: $eMail');
  // }

  // void showGenre() {
  //   print('Genre: $genre');
  // }

  // void showDate() {
  //   print('Date: $date');
  // }

  // void showPriceScala() {
  //   print('Price Scala: $priceScala');
  // }

  // void showCoverImageUrl() {
  //   print('Cover Image Url: $coverImageUrl');
  // }

  // void showProfilImageUrl() {
  //   print('Profil Image Url: $profilImageUrl');
  // }

  // void showPassword() {
  //   print('Password: $password');
  // }
}
