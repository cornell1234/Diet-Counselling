class DietPlan {
  String id;
  DateTime startDate;
  String email;

  DietPlan({required this.id, required this.startDate, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate,
      'email': email,
    };
  }
}
