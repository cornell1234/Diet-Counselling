import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/screens/auth/registration_Screen.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage('assets/icons/icons8-left-50.png'),
            color: Colors.black87,
          ),
          tooltip: 'Landing',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LandingScreen()),
            );
          },
        ),
        title: const Text(
          'BMI Calculation',
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: deviceSize.height * 0.18,
                  width: deviceSize.width * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/icons/person_96px.png'),
                        height: 100,
                        width: 100,
                      ),
                      Text('Male',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
                Container(
                  height: deviceSize.height * 0.18,
                  width: deviceSize.width * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                        image:
                            AssetImage('assets/icons/person_female_96px.png'),
                        height: 100,
                        width: 100,
                      ),
                      Text('Female',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: deviceSize.height * 0.18,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 39, 39),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            const TextSpan(text: '100'),
                            TextSpan(
                                text: 'cm',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: deviceSize.height * 0.18,
                  width: deviceSize.width * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 15, 15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  height: deviceSize.height * 0.18,
                  width: deviceSize.width * 0.4,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 17, 15, 15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: const [

                  ]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 55.0,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20, // set font size
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/healthy_food_50px.png')),
              label: 'Diet',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage('assets/icons/health_checkup_50px.png')),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/intelligence_50px.png')),
              label: 'AI Assistant',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/graph_report_50px.png')),
              label: 'Report',
            ),
          ],
          currentIndex: 0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            }
          }),
    );
  }
}
