import 'package:diet_counselling/screens/appointment_screen.dart';
import 'package:diet_counselling/screens/dietplan_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 3.2;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(children: [
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            children: [
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/calculator_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('BMI Calculation')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dietplanScreen()),
                  );
                },
                child: Container(
                  height: deviceSize.height * 0.2,
                  width: deviceSize.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/icons/healthy_food_64px.png'),
                        height: 100,
                        width: 100,
                      ),
                      Text('Personal Diet Plan')
                    ],
                  ),
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/notification_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Reminder Notifications')
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => appointmentScreen()),
                  );
                },
                child: Container(
                  height: deviceSize.height * 0.2,
                  width: deviceSize.width * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      Image(
                        image:
                            AssetImage('assets/icons/doctors_folder_64px.png'),
                        height: 100,
                        width: 100,
                      ),
                      Text('Doctor Appointment')
                    ],
                  ),
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/ai_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('AI assistant')
                  ],
                ),
              ),
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/graph_64px.png'),
                      height: 100,
                      width: 100,
                    ),
                    Text('Progress Report')
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
