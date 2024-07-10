import 'package:recipe_app/core/models/recipe.dart';

class MealUtils {
  static List<Map<String, String>> getIngredientsWithMeasures(Meal meal) {
    final ingredients = <String>[
      meal.strIngredient1,
      meal.strIngredient2,
      meal.strIngredient3,
      meal.strIngredient4,
      meal.strIngredient5,
      meal.strIngredient6,
      meal.strIngredient7,
      meal.strIngredient8,
      meal.strIngredient9,
      meal.strIngredient10,
      meal.strIngredient11,
      meal.strIngredient12,
      meal.strIngredient13,
      meal.strIngredient14,
      meal.strIngredient15,
      meal.strIngredient16,
      meal.strIngredient17,
      meal.strIngredient18,
      meal.strIngredient19,
      meal.strIngredient20
    ];

    final measures = <String>[
      meal.strMeasure1,
      meal.strMeasure2,
      meal.strMeasure3,
      meal.strMeasure4,
      meal.strMeasure5,
      meal.strMeasure6,
      meal.strMeasure7,
      meal.strMeasure8,
      meal.strMeasure9,
      meal.strMeasure10,
      meal.strMeasure11,
      meal.strMeasure12,
      meal.strMeasure13,
      meal.strMeasure14,
      meal.strMeasure15,
      meal.strMeasure16,
      meal.strMeasure17,
      meal.strMeasure18,
      meal.strMeasure19,
      meal.strMeasure20
    ];

    List<Map<String, String>> combined = [];
    for (int i = 0; i < ingredients.length; i++) {
      if (ingredients[i].isNotEmpty) {
        combined.add({"ingredient": ingredients[i], "measure": measures[i]});
      }
    }

    return combined;
  }

  static int getIngredientCount(Meal meal) {
    return getIngredientsWithMeasures(meal).length;
  }
}
