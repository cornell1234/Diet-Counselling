import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';

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
                  onPressed: () async {},
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
