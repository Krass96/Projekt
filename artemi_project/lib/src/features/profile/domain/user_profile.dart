class UserProfile {
  final String id;
  final String? coverImageUrl;
  final String? profilImageUrl;
  final String userName;
  final String password;
  final String eMail;
  final List<String> genres;
  final List<String> status;

  final int priceScala;

  UserProfile({
    required this.id,
    this.coverImageUrl,
    this.profilImageUrl,
    required this.userName,
    required this.password,
    required this.eMail,
    required this.genres,
    required this.status,
    required this.priceScala,
  });
}

final List<String> genres = [
  'Paint 🎨',
  'Music 🎹',
  'Dance 💃',
  'Comedy 😄',
  'Magic 🎩'
];
final List<String> status = ['Weekends', 'Evenings', 'Full-time', 'Part-time'];



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

