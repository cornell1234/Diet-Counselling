import 'package:diet_counselling/provider/appointment_provider.dart';
import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/provider/bmi_provider.dart';
import 'package:diet_counselling/provider/patient_provider.dart';
import 'package:diet_counselling/services/appointment_service.dart';
import 'package:diet_counselling/services/auth_services.dart';
import 'package:diet_counselling/services/bmi_services.dart';
import 'package:diet_counselling/services/patient_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initGetit() {
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<PatientProvider>(() => PatientProvider());
  locator.registerLazySingleton<PatientService>(() => PatientService());
  locator.registerLazySingleton<BMIProvider>(() => BMIProvider());
  locator.registerLazySingleton<BMIService>(() => BMIService());
  locator
      .registerLazySingleton<AppointmentProvider>(() => AppointmentProvider());
  locator.registerLazySingleton<AppointmentService>(() => AppointmentService());
}
