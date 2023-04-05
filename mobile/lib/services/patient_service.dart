import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/patient_model.dart';

class PatientService {
  final CollectionReference _patientsCollection =
      FirebaseFirestore.instance.collection('patients');

  Future<List<Patient>> getPatients() async {
    final snapshot = await _patientsCollection.get();
    return snapshot.docs.map((doc) => Patient(
          id: doc.id,
          name: doc['name'],
          age: doc['age'],
          gender: doc['gender'],
          address: doc['address'],
        )).toList();
  }

  Future<Patient> addPatient(String name, int age, String gender, String address) async {
    final docRef = await _patientsCollection.add({
      'name': name,
      'age': age,
      'gender': gender,
      'address': address,
    });
    return Patient(
      id: docRef.id,
      name: name,
      age: age,
      gender: gender,
      address: address,
    );
  }

  Future<void> deletePatient(String id) async {
    await _patientsCollection.doc(id).delete();
  }
}
