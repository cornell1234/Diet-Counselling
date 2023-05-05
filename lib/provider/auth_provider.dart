import 'package:diet_counselling/models/user_model.dart';
import 'package:diet_counselling/services/auth_services.dart';
import 'package:diet_counselling/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  CustomUser? _user;

  CustomUser? get user => _user;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      User? user =
          await _authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        CustomUser customUser = CustomUser.fromFirebaseUser(user);
        print(customUser);
        saveCredentials(customUser.uid, customUser.email);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      User? user =
          await _authService.registerWithEmailAndPassword(email, password);
      if (user != null) {
        CustomUser customUser = CustomUser.fromFirebaseUser(user);
        print(customUser);
        saveCredentials(customUser.uid, customUser.email);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
