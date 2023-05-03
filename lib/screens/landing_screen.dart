import 'dart:ffi';

import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/screens/appointment_screen.dart';
import 'package:diet_counselling/screens/chat_screen.dart';
import 'package:diet_counselling/screens/dietplan_screen.dart';
import 'package:diet_counselling/widgets/BMI_dialog.dart';
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
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
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
              Text(
                'Hello Cornell',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                      IconButton(
                        iconSize: 30,
                        onPressed: () {
                          // your code here
                        },
                        icon: Icon(Icons.notifications_none_rounded),
                      ),
                      Positioned(
                        top: 6.0,
                        right: 6.0,
                        child: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16.0,
                            minHeight: 16.0,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      // your code here
                    },
                    icon: Icon(Icons.person_2_outlined),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.2,
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelStyle: TextStyle(fontSize: 0),
                    ),
                    // Chart title
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: 'BMI READING',
                          // Enable data label
                          dataLabelSettings:
                              DataLabelSettings(isVisible: false))
                    ]),
              ),
              Container(
                  width: deviceSize.width * 1,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'height',
                        controller: heightController,
                      ),
                      CustomTextField(
                        label: 'weight',
                        controller: weightController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SizedBox(
                          height: 55.0,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                              double bmi = double.parse(weightController.text) /
                                  double.parse(heightController.text);
                              await BMIprovider.addBMI(bmi);
                              SnackBar(
                                content: Text(
                                    'Your BMI is ${bmi.toStringAsFixed(1)}'),
                                backgroundColor: Colors.grey,
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(seconds: 10),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                            ),
                            child: const Text(
                              'Calculate',
                              style: TextStyle(
                                fontSize: 16, // set font size
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
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
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appointmentScreen()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingScreen()),
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
