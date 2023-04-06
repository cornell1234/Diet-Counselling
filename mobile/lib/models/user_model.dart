import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;

  User({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
  });

  factory User.fromFirebaseUser(User user) {
    return User(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }
}
