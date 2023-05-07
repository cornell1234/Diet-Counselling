import 'package:diet_counselling/models/appointment_model.dart';
import 'package:diet_counselling/services/appointment_service.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  final AppointmentService _appointmentService = AppointmentService();
  Appointment? _appointment;

  Appointment? get appointment => _appointment;

  List<Appointment>? _appointments;

  List<Appointment>? get appointments => _appointments;

  Future<void> addappointment(String title, DateTime date) async {
    try {
      _appointment = await _appointmentService.addAppointment(title, date);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> getPatientsAppointment() async {
    try {
      _appointments = await _appointmentService.getAppointments();
      print('_appointments');
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> deleteAppointment(String id) async {
    try {
      await _appointmentService.deleteAppointment(id);
      // Remove the deleted appointment from the local list
      _appointments?.removeWhere((appointment) => appointment.id == id);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
