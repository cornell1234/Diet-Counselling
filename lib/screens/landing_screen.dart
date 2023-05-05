import 'dart:ffi';

import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/screens/ai_assistant/Assitant.dart';
import 'package:diet_counselling/screens/appointment_screen.dart';
import 'package:diet_counselling/screens/chat_screen.dart';
import 'package:diet_counselling/screens/dietplan_screen.dart';
import 'package:diet_counselling/services/bmi_services.dart';
import 'package:diet_counselling/widgets/BMI_dialog.dart';
import 'package:diet_counselling/widgets/appointment_dialog.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final BMIService _bmiService = BMIService();

  Future<List<PatientsBMI>> getPatientBMIData() async {
    try {
      List<BMI> patientBMIs = await _bmiService.getpatientBMIList();
      List<PatientsBMI> data =
          patientBMIs.map((bmi) => PatientsBMI.fromBMI(bmi)).toList();
      return data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  @override
  void initState() {
    final bmiprovider = Provider.of<BMIProvider>(context, listen: false);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BMIProvider>(context, listen: false).getpatientBMI();
    });
  }

  @override
  Widget build(BuildContext context) {
    final BMIprovider = Provider.of<BMIProvider>(context);
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 4.2;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/BAH_Logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    'BAH DIET APP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Body Mass Index Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return BMIDialog();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: deviceSize.height * 0.27,
                  child: FutureBuilder<List<PatientsBMI>>(
                    future: getPatientBMIData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<PatientsBMI> data = snapshot.data ?? [];
                        return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                          ),
                          series: <ChartSeries<PatientsBMI, String>>[
                            LineSeries<PatientsBMI, String>(
                              dataSource: data,
                              xValueMapper: (PatientsBMI bmi, _) => bmi.year,
                              yValueMapper: (PatientsBMI bmi, _) => bmi.bmi,
                              name: 'BMI READING',
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Diet Plan',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/cafe_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Break Fast')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/street_food_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Snack')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/rice_bowl_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Lunch')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/street_food_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Snack')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/rice_bowl_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Dinner')
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: deviceSize.width * 0.23,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 241, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/salad_50px.png',
                              width: 60,
                              height: 60,
                            ),
                            Text('Extra')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Appointments',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AppointmentDialog();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Book',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/intelligence_50px.png')),
              label: 'AI Assistant',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/account_50px.png')),
              label: 'Profile',
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
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Assitant(
                          title: 'My assistant',
                        )),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appointmentScreen()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Assitant(
                          title: 'My assistant',
                        )),
              );
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            }
          }),
    );
  }
}

class PatientsBMI {
  PatientsBMI(this.year, this.bmi);

  final String year;
  final double bmi;

  factory PatientsBMI.fromBMI(BMI bmi) {
    return PatientsBMI(bmi.date.toString(), bmi.bmi.toDouble());
  }
}
