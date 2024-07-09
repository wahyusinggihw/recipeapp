import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/constant/themes.dart';
import 'package:recipe_app/ui/router/route_generator.dart';
import 'package:recipe_app/ui/router/route_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setupScreenUtil(context);
    return MaterialApp(
      title: appName,
      theme: lightTheme,
      initialRoute: routeSplash,
      onGenerateRoute: RouteGenerator.generate,
    );
  }
}
