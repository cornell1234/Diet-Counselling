import 'package:flutter/material.dart';

void main() => runApp(const myApp());

class MyApp extends StateLessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatPage(),
    );
  }
}
