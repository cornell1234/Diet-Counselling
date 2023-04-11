import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/screens/auth/reg_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class registrationForm extends StatefulWidget {
  @override
  _registrationFormState createState() => _registrationFormState();
}

class _registrationFormState extends State<registrationForm> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                controller: email,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: password,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                controller: confirmpassword,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (password.text == confirmpassword.text) {
                      if (_formKey.currentState!.validate()) {
                        await authProvider.registerWithEmailAndPassword(
                            email.text, password.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => regDetails()),
                        );
                      } else {
                        // handle validation errors
                      }
                    } else {}
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
