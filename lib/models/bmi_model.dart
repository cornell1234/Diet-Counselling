class BMI {
  final String id;
  final String patient;
  final double bmi;
  final DateTime date;

  BMI(
      {required this.id,
      required this.patient,
      required this.bmi,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patient': patient,
      'bmi': bmi,
      'date': date,
    };
  }
}
