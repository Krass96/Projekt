import 'package:artemi_project/src/features/profile/domain/user_profile.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  UserProfile? _currentUser;

  // Getter für aktuellen Benutzer
  UserProfile? get currentUser => _currentUser;

  // Setter für aktuellen Benutzer (beim Login/Registrierung)
  void setCurrentUser(UserProfile user) {
    _currentUser = user;
  }

  // Benutzer ausloggen
  void clearCurrentUser() {
    _currentUser = null;
  }

  // Prüfen ob Benutzer eingeloggt ist
  bool get isLoggedIn => _currentUser != null;

  // Username bekommen (mit Fallback)
  String get userName => _currentUser?.userName ?? 'User';
}
