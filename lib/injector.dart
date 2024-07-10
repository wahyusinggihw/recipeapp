import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/api/api.dart';
import 'package:recipe_app/core/api/base_api.dart';
import 'package:recipe_app/core/services/recipe/recipe_service.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  //test
  if (!locator.isRegistered<Api>()) {
    locator.registerLazySingleton(() => Api());
  }

  if (locator.isRegistered(instance: BaseAPI()) == false) {
    locator.registerLazySingleton(() => BaseAPI());
  }

  locator.registerLazySingleton(() => RecipeService(locator<BaseAPI>()));
}
