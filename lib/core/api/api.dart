import 'dart:core';

class Api {
  //https://www.themealdb.com/api.php
  static const _baseUrl = 'http://www.themealdb.com/api/json/v1/1';

  String getSingleRandomRecipe = '$_baseUrl/random.php';
  String getAllRecipe = '$_baseUrl/search.php?s=';
  String getRecipeByName = '$_baseUrl/search.php?s=:name';
  String getRecipeById = '$_baseUrl/lookup.php?i=:id';
  String getListCategories = '$_baseUrl/categories.php';
  String getByMainIngredient = '$_baseUrl/filter.php?i=:ingredient';
  String getByCategory = '$_baseUrl/filter.php?c=:category';
  String getByArea = '$_baseUrl/filter.php?a=:area';
}
