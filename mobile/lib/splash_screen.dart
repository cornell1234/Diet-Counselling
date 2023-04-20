import 'package:diet_counselling/screens/auth/signin_Screen.dart';
import 'package:diet_counselling/screens/bmi_screen.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  Splash_screenState createState() => Splash_screenState();
}

class Splash_screenState extends State<Splash_screen> {
  String accessToken = "";
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {});
    //ignore: use build_content_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => bmiScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/icons/BAH_Logo.png'),
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Diet Counselling',
              textAlign: TextAlign.center,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900]),
            ),
          ),
        ],
      ),
    ));
  }
}
