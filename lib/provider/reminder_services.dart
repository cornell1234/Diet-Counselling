import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderService {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future<void> init() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> setDailyReminder(
      {required int hour, required int minute}) async {
    var time = Time(hour, minute, 0);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'daily_reminder_id',
        'Daily Reminder',
        'Daily reminder for healthy habits',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(sound: 'default', presentAlert: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Daily Reminder',
        'Don\'t forget to follow your diet plan, exercise, and stay hydrated!',
        time,
        platformChannelSpecifics);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

// TODO Implement this library.