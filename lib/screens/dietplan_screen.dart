import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class dietplanScreen extends StatefulWidget {
  const dietplanScreen({Key? key}) : super(key: key);

  @override
  dietplanScreenState createState() => dietplanScreenState();
}

class dietplanScreenState extends State<dietplanScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 3.2;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 238, 238),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Diet plan',
            style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage('assets/icons/notification_50px.png'),
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LandingScreen()),
                  );
                },
                icon: const ImageIcon(
                  AssetImage('assets/icons/home_50px.png'),
                  color: Colors.black,
                )),
          ]),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: GridView.count(
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  crossAxisCount: 5,
                  childAspectRatio: (itemWidth / itemHeight),
                  children: [
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('1')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('2')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('3')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('4')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('5')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('6')],
                      ),
                    ),
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [Text('Day'), Text('7')],
                      ),
                    ),
                  ]),
            )
          ])),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/healthy_food_50px.png')),
              label: 'Diet',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/math_50px.png'),
              ),
              label: 'BMI',
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
          selectedItemColor: Colors.amber[800],
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
