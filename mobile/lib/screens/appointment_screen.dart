// ignore_for_file: camel_case_types

import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class appointmentScreen extends StatefulWidget {
  const appointmentScreen({Key? key}) : super(key: key);

  @override
  appointmentScreenState createState() => appointmentScreenState();
}

class appointmentScreenState extends State<appointmentScreen> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

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
            'Appointments',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // ... other widgets ...

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  hintText: 'Pick a date',
                  suffixIcon: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: const Icon(Icons.calendar_today),
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDate == null
                      ? ''
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                ),
              ),
            ],
          )),
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
          currentIndex: 2,
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
