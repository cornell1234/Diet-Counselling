// // ignore_for_file: camel_case_types

// import 'package:diet_counselling/provider/appointment_provider.dart';
// import 'package:diet_counselling/screens/ai_assistant/Messages.dart';
// import 'package:diet_counselling/screens/landing_screen.dart';
// import 'package:diet_counselling/widgets/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class appointmentScreen extends StatefulWidget {
//   const appointmentScreen({Key? key}) : super(key: key);

//   @override
//   appointmentScreenState createState() => appointmentScreenState();
// }

// class appointmentScreenState extends State<appointmentScreen> {
//   DateTime? _selectedDate;
//   final TextEditingController reasonController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2100),
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final appointmentProvider = Provider.of<AppointmentProvider>(context);
//     var deviceSize = MediaQuery.of(context).size;
//     final double itemHeight = (deviceSize.height - kToolbarHeight - 24) / 3.2;
//     final double itemWidth = deviceSize.width / 2;
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 248, 248, 248),
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           title: const Text(
//             'Appointments',
//             style: TextStyle(
//                 color: Colors.black,
//                 decoration: TextDecoration.none,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const ImageIcon(
//                   AssetImage('assets/icons/notification_50px.png'),
//                   color: Colors.black,
//                 )),
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LandingScreen()),
//                   );
//                 },
//                 icon: const ImageIcon(
//                   AssetImage('assets/icons/home_50px.png'),
//                   color: Colors.black,
//                 )),
//           ]),
//       body: Center(
//         child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 CustomTextField(
//                   label: 'Reason',
//                   controller: reasonController,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Select Date',
//                     hintText: 'Pick a date',
//                     suffixIcon: GestureDetector(
//                       onTap: () => _selectDate(context),
//                       child: const Icon(Icons.calendar_today),
//                     ),
//                   ),
//                   readOnly: true,
//                   controller: TextEditingController(
//                     text: _selectedDate == null
//                         ? ''
//                         : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: SizedBox(
//                     height: 55.0,
//                     width: double.infinity,
//                     child: TextButton(
//                       onPressed: () async {
//                         await appointmentProvider.addappointment(
//                             reasonController.text as DateTime, _selectedDate!);
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Colors.blue),
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         )),
//                       ),
//                       child: const Text(
//                         'Book',
//                         style: TextStyle(
//                           fontSize: 16, // set font size
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/icons/healthy_food_50px.png')),
//               label: 'Diet',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(
//                 AssetImage('assets/icons/math_50px.png'),
//               ),
//               label: 'BMI',
//             ),
//             BottomNavigationBarItem(
//               icon:
//                   ImageIcon(AssetImage('assets/icons/health_checkup_50px.png')),
//               label: 'Appointment',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/icons/intelligence_50px.png')),
//               label: 'AI Assistant',
//             ),
//             BottomNavigationBarItem(
//               icon: ImageIcon(AssetImage('assets/icons/graph_report_50px.png')),
//               label: 'Report',
//             ),
//           ],
//           currentIndex: 2,
//           unselectedItemColor: Colors.black,
//           selectedItemColor: Colors.blue,
//           onTap: (int index) {
//             if (index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LandingScreen()),
//               );
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LandingScreen()),
//               );
//             } else if (index == 2) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LandingScreen()),
//               );
//             } else if (index == 3) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MessagesScreen(
//                           messages: [],
//                         )),
//               );
//             } else if (index == 4) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LandingScreen()),
//               );
//             }
//           }),
//     );
//   }
// }
