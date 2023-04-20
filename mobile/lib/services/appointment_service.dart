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
