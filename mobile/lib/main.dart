import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/splash_screen.dart';
import 'package:diet_counselling/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  initGetit();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => locator<AuthProvider>()),
  ], child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF010101),
          scaffoldBackgroundColor: Color.fromARGB(255, 238, 238, 238)),
      home: const Splash_screen(),
    );
  }
}
