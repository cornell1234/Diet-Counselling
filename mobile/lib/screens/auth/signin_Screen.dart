import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/screens/auth/registration_Screen.dart';
import 'package:diet_counselling/screens/landing_screen.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class signinForm extends StatefulWidget {
  @override
  _signinFormState createState() => _signinFormState();
}

class _signinFormState extends State<signinForm> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
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
                        'Sign In',
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
                      label: 'Password',
                      controller: passwordController,
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
                              await authProvider.signInWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text);
                              // handle authentication success
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingScreen()));
                            } else {
                              // handle validation errors
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            )),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16, // set font size
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SizedBox(
                        height: 55.0,
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registrationForm()));
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // set border radius
                            )),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16, // set font size
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        'or continue with',
                        style: TextStyle(
                          fontSize: 16, // set font size
                          color: Colors.grey[900],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                // your code here
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/google_40px.png',
                                  ),
                                  SizedBox(
                                      width:
                                          8), // add some space between icon and text
                                  Text(
                                    'Google',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () async {
                                // your code here
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/Facebook_40px.png',
                                  ),
                                  SizedBox(
                                      width:
                                          8), // add some space between icon and text
                                  Text(
                                    'Facebook',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registrationForm()),
                        );
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              const TextSpan(text: 'Dont have an account?'),
                              TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(color: Colors.grey[600])),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
