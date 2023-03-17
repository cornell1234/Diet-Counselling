import 'package:flutter/material.dart';

class signinForm extends StatefulWidget {
  @override
  _signinFormState createState() => _signinFormState();
}

class _signinFormState extends State<signinForm> {
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Username: $_username');
      print('Password: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: _submitForm,
                  child: Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
