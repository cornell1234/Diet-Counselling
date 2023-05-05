import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  TimeOfDay mealTime =
      TimeOfDay(hour: 8, minute: 0); // Set meal time to 8:00 am by default
  TimeOfDay snackTime =
      TimeOfDay(hour: 10, minute: 30); // Set snack time to 10:30 am by default
  TimeOfDay waterTime =
      TimeOfDay(hour: 14, minute: 0); // Set water time to 2:00 pm by default

  @override
  void initState() {
    super.initState();

    // Initialize flutterLocalNotificationsPlugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Set up initialization settings for Android and iOS
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    // Initialize the plugin with the initialization settings
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);

    // Schedule the notifications for the day
    scheduleNotifications();
  }

  Future<void> selectNotification(String? payload) async {
    // Handle the notification being selected
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<DateTime> _nextInstanceOfSnackTime() async {
    // Calculate the next snack time based on the current time
    var now = DateTime.now();
    var snackTimeOfDay =
        TimeOfDay(hour: snackTime.hour, minute: snackTime.minute);
    var snackTimeToday = DateTime(now.year, now.month, now.day,
        snackTimeOfDay.hour, snackTimeOfDay.minute);
    var snackTimeTomorrow = snackTimeToday.add(Duration(days: 1));
    var snackTimeDifference = snackTimeToday.difference(now);

    if (snackTimeDifference.isNegative) {
      snackTimeDifference = snackTimeTomorrow.difference(now);
    }

    return now.add(snackTimeDifference);
  }

  Future<void> scheduleNotifications() async {
    // Cancel any previously scheduled notifications to avoid duplicates
    await flutterLocalNotificationsPlugin.cancelAll();

    // Schedule the meal notification for the day
    var mealTimeOfDay = TimeOfDay(hour: mealTime.hour, minute: mealTime.minute);
    var mealTimeScheduled = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, mealTimeOfDay.hour, mealTimeOfDay.minute);
    var mealTimeDifference = mealTimeScheduled.difference(DateTime.now());
    if (mealTimeDifference.inMinutes > 0) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          0, // Notification ID
          'Time for meal!', // Notification title
          'Please eat your meal now.', // Notification body
          _nextInstanceOfMealTime(), // Date and time to show the notification
          const NotificationDetails(
            android: AndroidNotificationDetails('meal_channel_id',
                'Meal Reminders', 'Reminders for meals and snacks'),
          ), // Notification details
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload: 'meal'); // Payload for the notification
    }

    // Schedule the snack notification for the day
    var snackTimeOfDay =
        TimeOfDay(hour: snackTime.hour, minute: snackTime.minute);
    var snackTimeScheduled = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, snackTimeOfDay.hour, snackTimeOfDay.minute);
    var snackTimeDifference = snackTimeScheduled.difference(DateTime.now());
    if (snackTimeDifference.inMinutes > 0) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
          1, // Notification ID
          'Time for snack!', // Notification title
          'Please eat your snack now.', // Notification body
          _nextInstanceOfSnackTime(), // Date and time to show the notification
          const NotificationDetails(
            android: AndroidNotificationDetails(
                'snackTime', 'snack', 'channelDescription'),
          ),
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload: 'snack'); // Payload for the notification
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _nextInstanceOfMealTime {
  @override
  _nextInstanceOfMealTime createState() => _nextInstanceOfMealTime();
}
