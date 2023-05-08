import 'package:diet_counselling/models/diet_plan.dart';
import 'package:diet_counselling/services/dietplan_service.dart';
import 'package:flutter/material.dart';

class DietPlanProvider with ChangeNotifier {
  final DietPlanService _dietPlanService = DietPlanService();
  DietPlan? _dietPlan;

  DietPlan? get dietPlan => _dietPlan;

  List<DietPlan>? _dietPlans;

  List<DietPlan>? get dietPlans => _dietPlans;

  Future<void> createDietPlan() async {
    try {
      await _dietPlanService.createDietPlan();
      _dietPlan = dietPlan;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> getDietPlanByEmail() async {
    try {
      _dietPlan = await _dietPlanService.getDietPlanByEmail();
      print(_dietPlan);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updateDietPlan(DietPlan dietPlan) async {
    try {
      await _dietPlanService.updateDietPlan(dietPlan);
      _dietPlan = dietPlan;
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> deleteDietPlan(String dietPlanId) async {
    try {
      await _dietPlanService.deleteDietPlan(dietPlanId);
      // Remove the deleted diet plan from the local list
      _dietPlans?.removeWhere((dietPlan) => dietPlan.id == dietPlanId);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }
}
