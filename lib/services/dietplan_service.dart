import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_counselling/models/diet_plan.dart';
import 'package:diet_counselling/utils/utils.dart';

class DietPlanService {
  final CollectionReference _dietPlansCollection =
      FirebaseFirestore.instance.collection('diet_plans');

  Future<DietPlan> createDietPlan() async {
    var user = await getCredentials();
    var dateTime = DateTime.now();
    final docRef = await _dietPlansCollection.add({
      'email': user['email'],
      'startDate': dateTime,
    });
    return DietPlan(
      id: docRef.id,
      email: user['email'] ?? '',
      startDate: dateTime,
    );
  }

  // Stream<List<DietPlan>> getDietPlans() {
  //   return _dietPlansCollection.snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => DietPlan.fromJson(doc.data())).toList();
  //   });
  // }

  Future<DietPlan?> getDietPlanByEmail() async {
    var patient = await getCredentials();
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _dietPlansCollection
            .where('email', isEqualTo: patient['email'])
            .limit(1)
            .get() as QuerySnapshot<Map<String, dynamic>>;

    if (querySnapshot.docs.isNotEmpty) {
      final documentSnapshot = querySnapshot.docs.first;
      return DietPlan(
        id: documentSnapshot.id,
        email: documentSnapshot['email'],
        startDate: documentSnapshot['startDate'].toDate(),
      );
    }

    return null;
  }

  Future<void> updateDietPlan(DietPlan dietPlan) async {
    await _dietPlansCollection.doc(dietPlan.id).update(dietPlan.toJson());
  }

  Future<void> deleteDietPlan(String dietPlanId) async {
    await _dietPlansCollection.doc(dietPlanId).delete();
  }
}
