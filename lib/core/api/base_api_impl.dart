import 'package:recipe_app/core/models/recipe.dart';

abstract class BaseApiImpl {
  Future<Map<String, dynamic>> get(String url, {Map<String, dynamic>? query});
}
