import 'package:diet_counselling/provider/appointment_provider.dart';
import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/provider/patient_provider.dart';
import 'package:diet_counselling/splash_screen.dart';
import 'package:diet_counselling/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initGetit();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => locator<AuthProvider>()),
    ChangeNotifierProvider(create: (_) => locator<PatientProvider>()),
    ChangeNotifierProvider(create: (_) => locator<BMIProvider>()),
    ChangeNotifierProvider(create: (_) => locator<AppointmentProvider>()),
  ], child: const MyApp()));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(0, 255, 255, 255),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 248, 248, 248),
      systemNavigationBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF010101),
          scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238)),
      home: const Splash_screen(),
    );
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final initializationSettingsIOS = IOSInitializationSettings();
    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    runApp(MyApp());
  }

  Future<void> selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }
}
