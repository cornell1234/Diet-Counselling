import 'package:shared_preferences/shared_preferences.dart';

void saveCredentials(String uid, String email) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('uid', uid);
  await prefs.setString('email', email);
}

Future<Map<String, String>> getCredentials() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? uid = prefs.getString('uid');
  String? email = prefs.getString('email');
  return {'uid': uid ?? '', 'email': email ?? ''};
}

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