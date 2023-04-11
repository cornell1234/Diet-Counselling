import 'package:diet_counselling/models/patient_model.dart';
import 'package:diet_counselling/services/patient_service.dart';
import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  final PatientService _patientService = PatientService();
  Patient? _patient;

  Patient? get patient => _patient;

  Future<void> addPatient(
      String name, int age, String gender, String location) async {
    try {
      _patient = await _patientService.addPatient(name, age, gender, location);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
