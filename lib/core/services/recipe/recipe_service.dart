import 'package:recipe_app/core/api/base_api.dart';
import 'package:recipe_app/core/models/recipe.dart';

class RecipeService {
  BaseAPI api;
  RecipeService(this.api);

  Future<MealResponse> getSingleRandomRecipe() async {
    final response = await api.get(api.endPoint.getSingleRandomRecipe);
    return MealResponse.fromJson(response);
  }

  Future<MealResponse> getRecipes() async {
    final response = await api.get(api.endPoint.getAllRecipe);
    return MealResponse.fromJson(response);
  }
}
