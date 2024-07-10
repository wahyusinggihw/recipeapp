import 'package:flutter/material.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:recipe_app/ui/screens/recipes/recipe_detail_screen.dart';
import 'package:recipe_app/ui/screens/recipes/recipe_search_screen.dart';
import 'package:recipe_app/ui/screens/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: const RouteSettings(name: routeSplash),
        );
      case routeDashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
          settings: const RouteSettings(name: routeDashboard),
        );
      case routeRecipeDetail:
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: args as Meal),
          settings: const RouteSettings(name: routeRecipeDetail),
        );
      case routeSearchScreen:
        return MaterialPageRoute(
          builder: (_) => const RecipeSearchScreen(),
          settings: const RouteSettings(name: routeSearchScreen),
        );

      default:
      // return _errorRoute();
    }
    return null;
  }
}
