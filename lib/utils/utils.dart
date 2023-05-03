import 'package:shared_preferences/shared_preferences.dart';

setUser(String title, String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(title, value);
}

getUser(String title) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString(title) ?? '';
  return token;
}

setUsername(String title, String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString(title, value);
}

getUsername(String title) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String token = preferences.getString(title) ?? '';
  return token;
}

clear() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();
}