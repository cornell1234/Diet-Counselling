import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:diet_counselling/provider/reminder_services.dart';

class ReminderProvider with ChangeNotifier {
  ReminderService _reminderService = ReminderService();

  bool _isReminderSet = false;

  bool get isReminderSet => _isReminderSet;

  Future<void> initialize() async {
    await _reminderService.init();
    await _loadReminderStatus();
  }

  Future<void> _loadReminderStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isReminderSet = prefs.getBool('isReminderSet') ?? false;
    notifyListeners();
  }

  Future<void> _saveReminderStatus(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isReminderSet', value);
  }

  Future<void> setReminder({required int hour, required int minute}) async {
    await _reminderService.setDailyReminder(hour: hour, minute: minute);
    _isReminderSet = true;
    await _saveReminderStatus(true);
    notifyListeners();
  }

  Future<void> cancelReminder() async {
    await _reminderService.cancelAllNotifications();
    _isReminderSet = false;
    await _saveReminderStatus(false);
    notifyListeners();
  }
}
