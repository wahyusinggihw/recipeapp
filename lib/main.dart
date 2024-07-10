import 'package:flutter/material.dart';
import 'package:recipe_app/global_provider.dart';
import 'package:recipe_app/injector.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/constant/themes.dart';
import 'package:recipe_app/ui/router/route_generator.dart';
import 'package:recipe_app/ui/router/route_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  var providers = await GlobalProvider.register();
  runApp(
    MyApp(
      providers: providers,
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<dynamic> providers;
  const MyApp({super.key, required this.providers});

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
