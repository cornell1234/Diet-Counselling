import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';

class signinForm extends StatefulWidget {
  @override
  _signinFormState createState() => _signinFormState();
}

class _signinFormState extends State<signinForm> {
  final _formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextField(
                  label: 'Username',
                  controller: usernameController,
                ),
                CustomTextField(
                  label: 'Password',
                  controller: passwordController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(' Sign in'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
