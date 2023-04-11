import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField(
      {Key? key, required this.controller, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(5.5),
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.blue,
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.blue),
          filled: true,
          fillColor: Colors.blue[50]),
      controller: controller,
    );
  }
}
