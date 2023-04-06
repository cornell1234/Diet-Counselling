import 'package:diet_counselling/services/auth_services.dart';
import 'package:diet_counselling/utils/service_locator.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthService api = locator<AuthService>();

  ApiResponse<Auth> _auth = ApiResponse.loading('');
  ApiResponse<Auth> get auth => _auth;
}