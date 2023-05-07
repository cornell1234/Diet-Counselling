class DietPlan {
  String id;
  String startDate;
  String email;

  DietPlan({required this.id, required this.startDate, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startDate': startDate,
      'email': email,
    };
  }

  factory DietPlan.fromJson(Map<String, dynamic> json) {
    return DietPlan(
      id: json['id'],
      startDate: json['startDate'],
      email: json['email'],
    );
  }
}
