import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/bmi_model.dart';
import 'package:diet_counselling/utils/utils.dart';

class BMIService {
  final CollectionReference _bmiCollection =
      FirebaseFirestore.instance.collection('bmi');

  Future<List<BMI>> getBMIList() async {
    final snapshot = await _bmiCollection.get();
    return snapshot.docs
        .map((doc) => BMI(
              id: doc.id,
              name: doc['name'],
              bmi: doc['bmi'],
              date: doc['date'].toDate(),
            ))
        .toList();
  }

  Future<BMI> addBMI(int bmi) async {
    var name = await getUser('user');
    var date = DateTime.now();
    final docRef = await _bmiCollection.add({
      'name': name,
      'bmi': bmi,
      'date': date,
    });
    return BMI(
      id: docRef.id,
      name: name,
      bmi: bmi,
      date: date,
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
