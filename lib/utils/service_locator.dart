import 'package:diet_counselling/provider/auth_provider.dart';
import 'package:diet_counselling/services/auth_services.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initGetit() {
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
  locator.registerLazySingleton<AuthService>(() => AuthService());
}
