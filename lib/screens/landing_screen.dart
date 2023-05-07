import 'dart:ffi';

import 'package:diet_counselling/models/appointment_model.dart';
import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/provider/appointment_provider.dart';
import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/screens/ai_assistant/Assitant.dart';
import 'package:diet_counselling/services/bmi_services.dart';
import 'package:diet_counselling/widgets/BMI_dialog.dart';
import 'package:diet_counselling/widgets/appointment_dialog.dart';
import 'package:diet_counselling/widgets/diet_dialog.dart';
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
      Provider.of<AppointmentProvider>(context, listen: false)
          .getPatientsAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    var deviceSize = MediaQuery.of(context).size;
    final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 4.2;
    final double itemWidth = deviceSize.width / 2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 30, 8, 0),
        child: SingleChildScrollView(
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
                        onTap: (){
                          showCupertinoDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return const BreakfastDialog();
                              });
                        },
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
                                'assets/icons/cafe_48px.png',
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
                                'assets/icons/bagel_48px.png',
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
                                'assets/icons/rice_bowl_48px.png',
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
                                'assets/icons/bagel_48px.png',
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
                                'assets/icons/rice_bowl_48px.png',
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
                                'assets/icons/greek_salad_48px.png',
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
                  Consumer<AppointmentProvider>(
                    builder: (context, appointments, _) {
                      var appointment = appointments.appointments;
                      if (appointment == null || appointment.isEmpty) {
                        return Text('No appointments available');
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: appointment.length,
                        itemBuilder: (BuildContext context, int index) {
                          var Appointment = appointment[index];
                          return Container(
                            margin: const EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 5.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 243, 243, 243),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              horizontalTitleGap: 0,
                              title: Text(Appointment.title),
                              subtitle: Text("${Appointment.dateTime}"),
                              trailing: InkWell(
                                  onTap: () async {
                                    await appointmentProvider
                                        .deleteAppointment(Appointment.id);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('Appointment has been canceled'),
                                      backgroundColor: Colors.red,
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 10),
                                    ));
                                  },
                                  child: const ImageIcon(
                                      AssetImage('assets/icons/cancel_50px.png'),
                                      color: Colors.red,
                                      size: 40)),
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ]),
        ),
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
                MaterialPageRoute(builder: (context) => LandingScreen()),
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
