import 'package:flutter_for_people/navigator/navigation_service.dart';
import 'package:get_it/get_it.dart';

class Locator {
  GetIt locator = GetIt.instance;

  void setUpLocator() {
    locator.registerLazySingleton(() => NavigationService());
  }
}
