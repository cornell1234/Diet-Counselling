class BMI {
  final String id;
  final String name;
  final double bmi;
  final DateTime date;

  BMI(
      {required this.id,
      required this.name,
      required this.bmi,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'bmi': bmi,
      'date': date,
    };
  }
}
