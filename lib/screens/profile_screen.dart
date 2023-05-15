// ignore_for_file: use_build_context_synchronously

import 'package:diet_counselling/provider/patient_provider.dart';
import 'package:diet_counselling/screens/auth/signin_Screen.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:diet_counselling/utils/utils.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                          'My Profile',
                          style: TextStyle(
                            fontSize: 24, // set font size
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                      CustomTextField(
                        label: 'Email',
                        controller: emailController,
                      ),
                      CustomTextField(
                        label: 'Age',
                        controller: ageController,
                      ),
                      CustomTextField(
                        label: 'Password',
                        controller: passwordController,
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
                              clear();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signinForm()),
                                );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                            ),
                            child: const Text(
                              'LOG OUT',
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
