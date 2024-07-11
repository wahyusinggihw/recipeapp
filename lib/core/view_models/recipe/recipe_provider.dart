import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/core/services/recipe/recipe_service.dart';
import 'package:recipe_app/injector.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class RecipeProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool _onSearch = false;

  bool get onSearch => _onSearch;

  bool get isLoading => _isLoading;

  List<Meal> _singleRandomRecipe = [];

  List<Meal> get singleRandomRecipe => _singleRandomRecipe;

  List<Meal> _recipes = [];

  List<Meal> get recipes => _recipes;

  List<Meal> _todayRecipes = [];

  List<Meal> get todayRecipes => _todayRecipes;

  List<Meal>? _searchRecipes;

  List<Meal>? get searchRecipes => _searchRecipes;

  final recipeService = locator<RecipeService>();

  static RecipeProvider instance(BuildContext context) => Provider.of(context, listen: false);

  bool isDisposed = false;

  RecipeProvider() {
    _initializeProvider();
  }

  Future<void> _initializeProvider() async {
    await loadTodayRecipes();
  }

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
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadTodayRecipes() async {
    _isLoading = true;
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedDate = prefs.getString('todayRecipesDate');
    String todayDate = DateTime.now().toIso8601String().substring(0, 10); // YYYY-MM-DD

    if (storedDate == todayDate) {
      // Load the stored recipes
      List<String>? storedRecipes = prefs.getStringList('todayRecipes');
      if (storedRecipes != null) {
        _todayRecipes = storedRecipes.map((recipe) => Meal.fromJson(json.decode(recipe))).toList();
        _isLoading = false;
        notifyListeners();
        return;
      }
    }

    // Fetch new recipes if no stored recipes or the date is different
    await _fetchTodayRecipes();
  }

  Future<void> _fetchTodayRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await recipeService.getRecipes();
      if (response.meals != null) {
        _todayRecipes = _getRandomRecipes(response.meals!, 10);
        await _storeTodayRecipes();
      } else {
        _todayRecipes = [];
      }
    } on DioException catch (e, stacktrace) {
      debugPrint("Error: ${e.toString()}");
      debugPrint("Stacktrace: ${stacktrace.toString()}");
      _todayRecipes = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Meal> _getRandomRecipes(List<Meal> recipes, int count) {
    final random = Random();
    final randomRecipes = <Meal>[];
    final indices = <int>{};

    while (indices.length < count && indices.length < recipes.length) {
      indices.add(random.nextInt(recipes.length));
    }

    for (int index in indices) {
      randomRecipes.add(recipes[index]);
    }

    return randomRecipes;
  }

  Future<void> _storeTodayRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String todayDate = DateTime.now().toIso8601String().substring(0, 10); // YYYY-MM-DD

    List<String> recipeList = _todayRecipes.map((recipe) => json.encode(recipe.toJson())).toList();

    prefs.setString('todayRecipesDate', todayDate);
    prefs.setStringList('todayRecipes', recipeList);
  }

  void search(String keyw) async {
    _searchRecipes = null;
    if (keyw.isEmpty) {
      _searchRecipes = null;
      setOnSearch(false);
    } else {
      setOnSearch(true);
      try {
        final response = await recipeService.getRecipe(keyw);
        if (response.meals != null) {
          _searchRecipes = response.meals!;
        } else {
          _searchRecipes = [];
        }
      } on DioException catch (e, stacktrace) {
        debugPrint("Error: ${e.toString()}");
        debugPrint("Stacktrace: ${stacktrace.toString()}");
        _searchRecipes = [];
      }
    }
    setOnSearch(false);
  }

  setOnSearch(bool value) {
    _onSearch = value;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!isDisposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
