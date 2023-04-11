import 'package:flutter/material.dart';

class regDetails extends StatefulWidget {
  @override
  _regDetailsState createState() => _regDetailsState();
}

class _regDetailsState extends State<regDetails> {
  final _formKey = GlobalKey<FormState>();
  final fullname = TextEditingController();
  final age = TextEditingController();
  final location = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
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
