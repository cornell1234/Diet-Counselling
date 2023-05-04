import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/patient_model.dart';

class PatientService {
  final CollectionReference _patientsCollection =
      FirebaseFirestore.instance.collection('patients');

  Future<Patient> getPatient(String id) async {
    final doc = await _patientsCollection.doc(id).get();
    return Patient(
      id: doc.id,
      name: doc['name'],
      age: doc['age'],
      gender: doc['gender'],
      location: doc['location'],
    );
  }

  Future<List<Patient>> getPatients() async {
    final snapshot = await _patientsCollection.get();
    return snapshot.docs
        .map((doc) => Patient(
              id: doc.id,
              name: doc['name'],
              age: doc['age'],
              gender: doc['gender'],
              location: doc['location'],
            ))
        .toList();
  }

  Future<Patient> addPatient(
      String name, int age, String gender, String location) async {
    final docRef = await _patientsCollection.add({
      'name': name,
      'age': age,
      'gender': gender,
      'location': location,
    });
    return Patient(
      id: docRef.id,
      name: name,
      age: age,
      gender: gender,
      location: location,
    );
  }

  Future<void> deletePatient(String id) async {
    await _patientsCollection.doc(id).delete();
  }
}
