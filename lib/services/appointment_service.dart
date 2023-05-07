import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/appointment_model.dart';
import 'package:diet_counselling/utils/utils.dart';

class AppointmentService {
  final CollectionReference _appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  Future<List<Appointment>> getAppointments() async {
        var patient = await getCredentials();
    final snapshot =
        await _appointmentsCollection.where('email', isEqualTo: patient['email']).get();
    return snapshot.docs
        .map((doc) => Appointment(
              id: doc.id,
              email: doc['email'],
              title: doc['title'],
              dateTime: doc['dateTime'].toDate(),
            ))
        .toList();
  }

  Future<Appointment> addAppointment(String title, DateTime dateTime) async {
    var user = await getCredentials();
    final docRef = await _appointmentsCollection.add({
      'email': user['email'],
      'title': title,
      'dateTime': dateTime,
    });
    return Appointment(
      id: docRef.id,
      email: user['email'] ?? '',
      title: title,
      dateTime: dateTime,
    );
  }

  Future<void> deleteAppointment(String id) async {
    await _appointmentsCollection.doc(id).delete();
  }
}
