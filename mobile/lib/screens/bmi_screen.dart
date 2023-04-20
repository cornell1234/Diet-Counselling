import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/screens/auth/registration_Screen.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bmiScreen extends StatefulWidget {
  const bmiScreen({super.key});

  @override
  _bmiScreenState createState() => _bmiScreenState();
}

class _bmiScreenState extends State<bmiScreen> {
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
            Row(
              children: [Container()],
            )
          ],
        ),
      ),
    );
  }
}
