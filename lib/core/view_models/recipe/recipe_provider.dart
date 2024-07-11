import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/core/services/recipe/recipe_service.dart';
import 'package:recipe_app/injector.dart';

class RecipeProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Meal> _singleRandomRecipe = [];

  List<Meal> get singleRandomRecipe => _singleRandomRecipe;

  List<Meal> _recipes = [];

  List<Meal> get recipes => _recipes;

  final recipeService = locator<RecipeService>();

  // RecipeProvider() {
  //   getRecipes();
  // }

  Future<void> getSingleRandomRecipe() async {
    try {
      final response = await recipeService.getSingleRandomRecipe();
      _singleRandomRecipe = response.meals ?? [];
    } on DioException catch (e, stacktrace) {
      debugPrint("Error: ${e.toString()}");
      debugPrint("Stacktrace: ${stacktrace.toString()}");
      _singleRandomRecipe = [];
    }
    notifyListeners();
  }

  Future<void> getRecipes() async {
    _isLoading = true;
    try {
      final response = await recipeService.getRecipes();
      _recipes = response.meals!;
    } on DioException catch (e, stacktrace) {
      debugPrint("Error: ${e.toString()}");
      debugPrint("Stacktrace: ${stacktrace.toString()}");
      _recipes = [];
    } finally {
      _isLoading = false;
    }
    // _isLoading = false;
    notifyListeners();
  }
}
