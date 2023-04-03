import 'package:firebase_auth/firebase_auth.dart';

class MyUser {
  final String uid;
  final String email;
  final String displayName;
  final String photoURL;

  MyUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoURL,
  });

  factory MyUser.fromFirebaseUser(User user) {
    return MyUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoURL: user.photoURL ?? '',
    );
  }
}
