import 'package:provider/provider.dart';
import 'package:recipe_app/core/view_models/recipe/recipe_provider.dart';

class GlobalProvider {
  static Future register() async => [
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ];
}
