import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/appointment_model.dart';

class AppointmentService {
  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  Future<List<Appointment>> getAppointments() async {
    final snapshot = await _appointmentsCollection.get();
    return snapshot.docs.map((doc) => Appointment(
          id: doc.id,
          title: doc['title'],
          dateTime: doc['dateTime'].toDate(),
          location: doc['location'],
        )).toList();
  }

  Future<Appointment> addAppointment(
      String title, DateTime dateTime, String location) async {
    final docRef = await _appointmentsCollection.add({
      'title': title,
      'dateTime': dateTime,
      'location': location,
    });
    return Appointment(
      id: docRef.id,
      title: title,
      dateTime: dateTime,
      location: location,
    );
  }

  Future<void> deleteAppointment(String id) async {
    await _appointmentsCollection.doc(id).delete();
  }
}
