import 'package:cloud_firestore/cloud_firestore.dart';
class User {
  final String id;
  final String name;
  final int bmi;

  User({required this.id, required this.name, required this.bmi});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'bmi': bmi,
    };
  }
}



class FirebaseService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    await _usersCollection.doc(user.id).set(user.toMap());
  }

  Future<User?> getUser(String id) async {
    final docSnapshot = await _usersCollection.doc(id).get();
    if (docSnapshot.exists) {
      final userData = docSnapshot.data()!;
      return User(
        id: id,
        name: userData['name'],
        bmi: userData['bmi'],
      );
    } else {
      return null;
    }
  }
}


FirebaseService firebaseService = FirebaseService();

// Create a new user object and add it to Firebase
User newUser = User(id: '1', name: 'John Doe', bmi: 25);
await firebaseService.addUser(newUser);

// Retrieve a user object from Firebase
User? retrievedUser = await firebaseService.getUser('1');
if (retrievedUser != null) {
  print('Name: ${retrievedUser.name}, BMI: ${retrievedUser.bmi}');
}
