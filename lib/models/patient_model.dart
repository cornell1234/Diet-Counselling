import 'package:flutter/foundation.dart';

class Patient {
  final String id;
  final String name;
  final String email;
  final int age;
  final String gender;
  final String location;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.location,
  });
}
