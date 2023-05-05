import 'package:firebase_auth/firebase_auth.dart';

class CustomUser {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;

  CustomUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
  });

  factory CustomUser.fromFirebaseUser(User user) {
    return CustomUser(
      uid: user.uid,
      email: user.email!,
      displayName: user.displayName ?? '',
      photoURL: user.photoURL ?? '',
    );
  }
}
