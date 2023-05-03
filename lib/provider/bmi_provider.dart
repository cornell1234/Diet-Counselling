import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/services/bmi_services.dart';
import 'package:flutter/material.dart';

class BMIProvider extends ChangeNotifier {
  final BMIService _bmiService = BMIService();
  BMI? _bmi;

  BMI? get bmi => _bmi;

  Future<void> addPatient(
    int bmi) async {
    try {
      _bmi = await _bmiService.addBMI(bmi);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
