import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/utils/utils.dart';

class BMIService {
  final CollectionReference _bmiCollection =
      FirebaseFirestore.instance.collection('bmi');

  Future<List<BMI>> getpatientBMIList() async {
    var patient = await getCredentials();
    final snapshot = await _bmiCollection
        .where('patient', isEqualTo: patient['email'])
        .orderBy('date', descending: false)
        .get();
    return snapshot.docs
        .map((doc) => BMI(
              id: doc.id,
              patient: doc['patient'],
              bmi: doc['bmi'],
              date: doc['date'].toDate(),
            ))
        .toList();
  }

  Future<BMI?> getLatestBMIByEmail() async {
    print('object');
    var patient = await getCredentials();
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _bmiCollection
            .where('patient', isEqualTo: patient['email'])
            .orderBy('date',
                descending:
                    true) // Order by the 'date' field in descending order
            .limit(1)
            .get() as QuerySnapshot<Map<String, dynamic>>;

    if (querySnapshot.docs.isNotEmpty) {
      final documentSnapshot = querySnapshot.docs.first;
      return BMI(
        id: documentSnapshot.id,
        patient: documentSnapshot['patient'],
        bmi: documentSnapshot['bmi'],
        date: documentSnapshot['date'].toDate(),
      );
    }

    return null;
  }

  Future<List<BMI>> getBMIList() async {
    final snapshot = await _bmiCollection.get();
    return snapshot.docs
        .map((doc) => BMI(
              id: doc.id,
              patient: doc['name'],
              bmi: doc['bmi'],
              date: doc['date'].toDate(),
            ))
        .toList();
  }

  Future<BMI> addBMI(double bmi) async {
    var patient = await getCredentials();
    String? email = patient['email'];
    print(patient['email']);
    var date = DateTime.now();
    final docRef = await _bmiCollection.add({
      'patient': patient['email'],
      'bmi': bmi,
      'date': date,
    });
    return BMI(
      id: docRef.id,
      bmi: bmi,
      date: date,
      patient: '',
    );
  }

  Future<void> updateBMI(String id, String name, int bmi, DateTime date) async {
    await _bmiCollection.doc(id).update({
      'name': name,
      'bmi': bmi,
      'date': date,
    });
  }

  Future<void> deleteBMI(String id) async {
    await _bmiCollection.doc(id).delete();
  }
}
