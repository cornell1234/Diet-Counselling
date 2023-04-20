import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/appointment_model.dart';

class AppointmentService {
  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  Future<List<Appointment>> getAppointments() async {
    final snapshot = await _appointmentsCollection.get();
    return snapshot.docs
        .map((doc) => Appointment(
              id: doc.id,
              email: doc['email'],
              title: doc['title'],
              dateTime: doc['dateTime'].toDate(),
              location: doc['location'],
            ))
        .toList();
  }

  //Modify the add function in a way that it should check first if the doctor is not booked at that dateTime
  class DoctorSchedule {
  DateTime startTime;
  DateTime endTime;

  DoctorSchedule({required this.startTime, required this.endTime});
}

class Appointment {
  DoctorSchedule doctorSchedule;

  Appointment({required this.doctorSchedule});
}

class Doctor {
  String name;
  List<DoctorSchedule> schedules;
  List<Appointment> appointments;

  Doctor({required this.name, required this.schedules, required this.appointments});

  List<DoctorSchedule> getFreeSchedules(DateTime date) {
    List<DoctorSchedule> freeSchedules = [];

    // Find all schedules for the given date
    List<DoctorSchedule> schedulesForDate = schedules.where((schedule) => schedule.startTime.year == date.year && schedule.startTime.month == date.month && schedule.startTime.day == date.day).toList();

    // Check availability for each schedule
    for (var schedule in schedulesForDate) {
      bool isBooked = false;

      // Check if the schedule overlaps with any existing appointments
      for (var appointment in appointments) {
        if (appointment.doctorSchedule.startTime.isBefore(schedule.endTime) && appointment.doctorSchedule.endTime.isAfter(schedule.startTime)) {
          isBooked = true;
          break;
        }
      }

      // If the schedule is not booked, add it to the freeSchedules list
      if (!isBooked) {
        freeSchedules.add(schedule);
      }
    }

    return freeSchedules;
  }
}
  Future<Appointment> addAppointment(
      String email, String title, DateTime dateTime, String location) async {
    final docRef = await _appointmentsCollection.add({
      'email': email,
      'title': title,
      'dateTime': dateTime,
      'location': location,
    });
    return Appointment(
      id: docRef.id,
      email: email,
      title: title,
      dateTime: dateTime,
      location: location,
    );
  }

  Future<void> deleteAppointment(String id) async {
    await _appointmentsCollection.doc(id).delete();
  }
}
