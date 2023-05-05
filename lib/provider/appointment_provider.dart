import 'package:diet_counselling/models/appointment_model.dart';
import 'package:diet_counselling/services/appointment_service.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentService _appointmentService = AppointmentService();
  Appointment? _appointment;

  Appointment? get appointment => _appointment;

  Future<void> addappointment(String title, DateTime date) async {
    try {
      _appointment =
          await _appointmentService.addAppointment(title, date);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> getBMI() async {
    try {
      _appointment =
          (await _appointmentService.getAppointmentList()) as Appointment?;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
