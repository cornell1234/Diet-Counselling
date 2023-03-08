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
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          // Image(
          //   image: AssetImage('assets/icons/splash_screen.png'),
          //   height: 200,
          //   width: 200,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          Text( 
          ' Diet Counselling',
          textAlign: TextAlign.center,
          style:TextStyle(
             decoration: TextDecoration.none,
             fontSize: 18,
             color: Color.fromARGB(255, 255, 22, 22)
           ),
          ),
        ],
      ),
    ));
  }
}
