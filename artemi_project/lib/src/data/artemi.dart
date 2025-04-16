import 'artist_card.dart';
import 'button.dart';
import 'user_profile.dart';

void main() {
  // ArtisCard Test

  ArtistCard a = ArtistCard(
    profilePicUrl: null,
    email: '',
    isFavorit: true,
    artistName: 'Leonardo',
    rating: 4.2,
    categories: categories.Maler,
    price: 500,
  );
  ArtistCard b = ArtistCard(
    profilePicUrl: null,
    email: '',
    isFavorit: false,
    artistName: 'Mozart',
    rating: 3.6,
    categories: categories.Musiker,
    price: 1000,
  );
  ArtistCard c = ArtistCard(
    profilePicUrl: null,
    email: '',
    isFavorit: false,
    artistName: 'Charlie',
    rating: 5.0,
    categories: categories.Komediant,
    price: 200,
  );

  a.showArtistName();
  b.showPrice();
  c.showRating();
  a.checkFavorit();

  // Button Test

  Button logIn = Button('Log In', 'Gold', true);
  Button signUp = Button('Sing Up', 'Gold', false);
  Button apple = Button('Sing up with Apple', 'Gold', false);

  logIn.showColor();
  signUp.showText();
  apple.showOnPressed();

  // User Test

  UserProfile d = UserProfile(
    coverImageUrl: null,
    profilImageUrl: null,
    userName: 'Leonardo',
    password: '*',
    eMail: 'leo@web.de',
    genre: 'painter',
    date: DateTime(1452),
    priceScala: 0 - 100,
  );
  UserProfile e = UserProfile(
    coverImageUrl: null,
    profilImageUrl: null,
    userName: 'Rafaelo',
    password: '*',
    eMail: 'rafa@web.de',
    genre: 'musiker',
    date: DateTime(1483),
    priceScala: 500,
  );
  UserProfile f = UserProfile(
    coverImageUrl: null,
    profilImageUrl: null,
    userName: 'Charlie',
    password: '*',
    eMail: 'char@web.de',
    genre: 'komediant',
    date: DateTime(1889),
    priceScala: 300,
  ); 

  d.showUserName();
  e.showEmail();
  f.showGenre();
}
