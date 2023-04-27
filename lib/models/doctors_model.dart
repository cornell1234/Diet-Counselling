import 'package:diet_counselling/models/appointment_model.dart';

class Doctor {
  final String id;
  final String name;
  final String email;
  final List<Appointment> appointments;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.appointments,
  });

  static final List<DateTime> _schedule = [
    DateTime(2023, 4, 21, 9, 0),
    DateTime(2023, 4, 21, 9, 30),
    DateTime(2023, 4, 21, 10, 0),
    DateTime(2023, 4, 21, 10, 30),
    DateTime(2023, 4, 21, 11, 0),
    DateTime(2023, 4, 21, 11, 30),
    DateTime(2023, 4, 21, 12, 0),
    DateTime(2023, 4, 21, 13, 0),
    DateTime(2023, 4, 21, 13, 30),
    DateTime(2023, 4, 21, 14, 0),
    DateTime(2023, 4, 21, 14, 30),
    DateTime(2023, 4, 21, 15, 0),
    DateTime(2023, 4, 21, 15, 30),
    DateTime(2023, 4, 21, 16, 0),
    DateTime(2023, 4, 21, 16, 30),
  ];

  List<DateTime> getFreeTimeSlots(DateTime start, DateTime end) {
    final bookedSlots = [
      for (final appointment in appointments)
        if (appointment.dateTime.isAfter(start) &&
            appointment.dateTime.isBefore(end))
          appointment.dateTime
    ];
    return _schedule
        .where((slot) =>
            slot.isAfter(start) &&
            slot.isBefore(end) &&
            !bookedSlots.contains(slot))
        .toList();
  }
}
