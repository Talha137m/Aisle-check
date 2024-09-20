import 'package:aislecheck/core/services/inventry_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt locator = GetIt.instance;

void setupLocator() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(
    () => sharedPreferences,
  );
  locator.registerSingleton(InventryService());
}
