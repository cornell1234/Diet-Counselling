import 'package:diet_counselling/models/user_model.dart';
import 'package:diet_counselling/services/auth_services.dart';
import 'package:diet_counselling/utils/utils.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      User user =
          await _authService.signInWithEmailAndPassword(email, password);
      saveCredentials(user.uid, user.email);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      _user = await _authService.registerWithEmailAndPassword(email, password);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
