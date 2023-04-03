import 'package:flutter/foundation.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String address;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
  });
}
