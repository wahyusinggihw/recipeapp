import 'package:flutter/material.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:recipe_app/ui/screens/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeDashboard:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      default:
      // return _errorRoute();
    }
    return null;
  }
}
