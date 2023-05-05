import 'package:diet_counselling/provider/appointment_provider.dart';
import 'package:diet_counselling/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentDialog extends StatefulWidget {
  const AppointmentDialog({super.key});

  @override
  AppointmentDialogState createState() => AppointmentDialogState();
}

class AppointmentDialogState extends State<AppointmentDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        title: const Text('BMI Calculation'),
        content: Form(
            key: formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomTextField(
                label: 'Title',
                controller: titleController,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Select Date',
                  hintText: 'Pick a date',
                  suffixIcon: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: const Icon(Icons.calendar_today),
                  ),
                ),
                readOnly: true,
                controller: TextEditingController(
                  text: _selectedDate == null
                      ? ''
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                ),
              ),
              SizedBox(
                height: 55.0,
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    await appointmentProvider.addappointment(
                        titleController.text, _selectedDate!);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Appointment booked successfully'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 10),
                    ));
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
                    'Book',
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
