// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var isDark = MediaQuery. of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){}, icon: const Icon(LineAwesomeIcons.angle_left))
//         title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
//         ]
//       )
//       body: SingleChildScrollView(
//         child: profilenmenuwidget(context)
//               ),
//         );

//   }

//   Container profilenmenuwidget(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(tDefaultSize),
//         child: Column(
//           children: (width: 120, height: 120,
//             child: ClipRRect (borderRadius: BorderRadius.circular 100,child: image:(image: AssetImage(tProfileImage),))),
//         ),
//         const SizeBox(height: 10),
//         Text(tProfileHeading, style: Themeof(context).textTheme.headline4),
//         Text(tProfilesubHeading, style: Themeof(context).textTheme.bodyText2),
//         const SizedBox(height: 20),
//         sizedBox(
//           width: 200,
//           child: ElevatedButton(
//             onPressed: () {},
//             child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: tPrimaryColor, side: BorderSize.name, shape: const StadiumBorder()),
//             child: const Text(tEditProfile, style: TextStyle(color: tDarkColor)),
//             ),
//             ),
//             const SizedBox(height: 30),
//             const Divider(),
//             const SizedBox(height: 10),

//             ///MENU
//             profilemenuwidget(title: "Settings", icon: LineAwesomeIcons.cog () {}),
//             profilemenuwidget("Billing Details", icon: LineAwesomeIcons.wallet, onPress: () {}),
//             profilemenuwidget("User Management", icon: LineAwesomeIcons.user_check, onPress: () {}),
//             const Divider(),
//             const SizedBox(height: 10),
//             profilemenuwidget(title: "information", icon: LineAwesomeIcons.info, onPress: () {}),
//             profilemenuwidget(
//               title: "Logout",
//               icon: LineAwesomeIcons.alternate_sign_out,
//               textColor: Colors.red,
//               endIcon: false,
//               onPress: () {}
//             ),
//     );
//   }
// }

// class profilemenuwidget extends StatelessWidget {
//   const profilemenuwidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.textColor,
//   }) : super(key: key);

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final color? textColor;

//   @override
//   Widget build(BuildContext context) {
//     var IsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     var iconColor = IsDark ? tPrimaryColor : tAccentColor;
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40, height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: iconColor.withOpacity(0.1),
//         )
//         child: const Icon(LineAwesomeIcons.cog, color: IconColor),
//       )
//       title: Text(tMenu1, style: Theme.of(context).textTheme.bodyText1),
//       trailing: Container(
//          width: 30, height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.grey.withOpacity(0.1),
//         )
//         child: const Icon(LineAwesomeIcons.angle_right, size: 18.0, color: Colors.grey)) : null,
//       );
//   }
// }
// ignore_for_file: use_build_context_synchronously

import 'package:diet_counselling/provider/patient_provider.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class regDetails extends StatefulWidget {
  @override
  _regDetailsState createState() => _regDetailsState();
}

class _regDetailsState extends State<regDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Text(
                          'Account details',
                          style: TextStyle(
                            fontSize: 24, // set font size
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      CustomTextField(
                        label: 'Full Name',
                        controller: fullnameController,
                      ),
                      CustomTextField(
                        label: 'Age',
                        controller: ageController,
                      ),
                      CustomTextField(
                        label: 'Location',
                        controller: locationController,
                      ),
                      CustomTextField(
                        label: 'Phone Number',
                        controller: phonenumberController,
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
                              if (_formKey.currentState!.validate()) {
                                await patientProvider.addPatient(
                                    fullnameController.text,
                                    int.parse(ageController.text),
                                    locationController.text,
                                    phonenumberController.text);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingScreen()),
                                );
                              } else {
                                // handle validation errors
                              }
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
                              'Continue',
                              style: TextStyle(
                                fontSize: 16, // set font size
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
