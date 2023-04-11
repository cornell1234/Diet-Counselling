import 'package:diet_counselling/provider/patient_provider.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class regDetails extends StatefulWidget {
  @override
  _regDetailsState createState() => _regDetailsState();
}

class _regDetailsState extends State<regDetails> {
  final _formKey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final age = TextEditingController();
  final location = TextEditingController();
  final phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'FullName'),
                controller: fullname,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                controller: age,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                controller: location,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                controller: phonenumber,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await patientProvider.addPatient(fullname.text,
                          int.parse(age.text), location.text, phonenumber.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandingScreen()),
                      );
                    } else {
                      // handle validation errors
                    }
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
