import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIDialog extends StatefulWidget {
  const BMIDialog({super.key});

  @override
  BMIDialogState createState() => BMIDialogState();
}

class BMIDialogState extends State<BMIDialog> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final BMIprovider = Provider.of<BMIProvider>(context);
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('BMI Calculation'),
        content: Form(
            key: formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                label: 'Weight',
                controller: weightController,
              ),
              CustomTextField(
                controller: heightController,
                label: 'Height',
              ),
              SizedBox(
                height: 55.0,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    double bmi = double.parse(weightController.text) /
                        double.parse(heightController.text);
                    await BMIprovider.addBMI(bmi);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Your BMI is ${bmi.toStringAsFixed(1)}'),
                        backgroundColor: Color.fromARGB(255, 150, 150, 150),
                        behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 10),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 18, // set font size
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
