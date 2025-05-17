import '../features/book/domain/artist_card_db.dart';
import '../features/onboarding/domain/button.dart';
import '../features/profile/domain/user_profile.dart';

void main() {
  // ArtisCard Test

  ArtistCardDb a = ArtistCardDb(
    profilePicUrl: null,
    isFavorit: true,
    artistName: 'Leonardo',
    rating: 4.2,
    genre: Categories.paint,
    price: 500,
  );
  ArtistCardDb b = ArtistCardDb(
    profilePicUrl: null,
    isFavorit: false,
    artistName: 'Mozart',
    rating: 3.6,
    genre: Categories.music,
    price: 1000,
  );
  ArtistCardDb c = ArtistCardDb(
    profilePicUrl: null,
    isFavorit: false,
    artistName: 'Charlie',
    rating: 5.0,
    genre: Categories.comedy,
    price: 200,
  );

  // a.showArtistName();
  // b.showPrice();
  // c.showRating();
  // a.checkFavorit();

  //Button Test

  Button logIn = Button('Log In', 'Gold', true);
  Button signUp = Button('Sing Up', 'Gold', false);
  Button apple = Button('Sing up with Apple', 'Gold', false);

  logIn.showColor();
  signUp.showText();
  apple.showOnPressed();

  // User Test

  UserProfile painter = UserProfile(
    id: '1',
    userName: 'Leonardo',
    password: '*',
    eMail: 'leo@web.de',
    genres: ['painter'],
    status: ['Weekends'],
    priceScala: 2000,
  );
  UserProfile musiker = UserProfile(
    id: '2',
    coverImageUrl: null,
    profilImageUrl: null,
    userName: 'Rafaelo',
    password: '*',
    eMail: 'rafa@web.de',
    genres: ['musiker'],
    status: ['Part-time'],
    priceScala: 500,
  );
  UserProfile comediant = UserProfile(
    id: '3',
    coverImageUrl: null,
    profilImageUrl: null,
    userName: 'Charlie',
    password: '*',
    eMail: 'char@web.de',
    genres: ['komediant'],
    status: ['Full-time'],
    priceScala: 300,
  );

  // d.showUserName();
  // e.showEmail();
  // f.showGenre();
}
