import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart'; // Ensure this matches the file name

@JsonSerializable(explicitToJson: true)
class MealResponse {
  final List<Meal>? meals; // Allow meals to be null

  MealResponse({this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) => _$MealResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealResponseToJson(this);
}

@JsonSerializable()
class Meal {
  final String idMeal;
  final String strMeal;
  final String? strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String strYoutube;

  @JsonKey(defaultValue: '')
  final String strIngredient1;
  @JsonKey(defaultValue: '')
  final String strIngredient2;
  @JsonKey(defaultValue: '')
  final String strIngredient3;
  @JsonKey(defaultValue: '')
  final String strIngredient4;
  @JsonKey(defaultValue: '')
  final String strIngredient5;
  @JsonKey(defaultValue: '')
  final String strIngredient6;
  @JsonKey(defaultValue: '')
  final String strIngredient7;
  @JsonKey(defaultValue: '')
  final String strIngredient8;
  @JsonKey(defaultValue: '')
  final String strIngredient9;
  @JsonKey(defaultValue: '')
  final String strIngredient10;
  @JsonKey(defaultValue: '')
  final String strIngredient11;
  @JsonKey(defaultValue: '')
  final String strIngredient12;
  @JsonKey(defaultValue: '')
  final String strIngredient13;
  @JsonKey(defaultValue: '')
  final String strIngredient14;
  @JsonKey(defaultValue: '')
  final String strIngredient15;
  @JsonKey(defaultValue: '')
  final String strIngredient16;
  @JsonKey(defaultValue: '')
  final String strIngredient17;
  @JsonKey(defaultValue: '')
  final String strIngredient18;
  @JsonKey(defaultValue: '')
  final String strIngredient19;
  @JsonKey(defaultValue: '')
  final String strIngredient20;

  @JsonKey(defaultValue: '')
  final String strMeasure1;
  @JsonKey(defaultValue: '')
  final String strMeasure2;
  @JsonKey(defaultValue: '')
  final String strMeasure3;
  @JsonKey(defaultValue: '')
  final String strMeasure4;
  @JsonKey(defaultValue: '')
  final String strMeasure5;
  @JsonKey(defaultValue: '')
  final String strMeasure6;
  @JsonKey(defaultValue: '')
  final String strMeasure7;
  @JsonKey(defaultValue: '')
  final String strMeasure8;
  @JsonKey(defaultValue: '')
  final String strMeasure9;
  @JsonKey(defaultValue: '')
  final String strMeasure10;
  @JsonKey(defaultValue: '')
  final String strMeasure11;
  @JsonKey(defaultValue: '')
  final String strMeasure12;
  @JsonKey(defaultValue: '')
  final String strMeasure13;
  @JsonKey(defaultValue: '')
  final String strMeasure14;
  @JsonKey(defaultValue: '')
  final String strMeasure15;
  @JsonKey(defaultValue: '')
  final String strMeasure16;
  @JsonKey(defaultValue: '')
  final String strMeasure17;
  @JsonKey(defaultValue: '')
  final String strMeasure18;
  @JsonKey(defaultValue: '')
  final String strMeasure19;
  @JsonKey(defaultValue: '')
  final String strMeasure20;

  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  Meal({
    required this.idMeal,
    required this.strMeal,
    this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    required this.strYoutube,
    this.strIngredient1 = '',
    this.strIngredient2 = '',
    this.strIngredient3 = '',
    this.strIngredient4 = '',
    this.strIngredient5 = '',
    this.strIngredient6 = '',
    this.strIngredient7 = '',
    this.strIngredient8 = '',
    this.strIngredient9 = '',
    this.strIngredient10 = '',
    this.strIngredient11 = '',
    this.strIngredient12 = '',
    this.strIngredient13 = '',
    this.strIngredient14 = '',
    this.strIngredient15 = '',
    this.strIngredient16 = '',
    this.strIngredient17 = '',
    this.strIngredient18 = '',
    this.strIngredient19 = '',
    this.strIngredient20 = '',
    this.strMeasure1 = '',
    this.strMeasure2 = '',
    this.strMeasure3 = '',
    this.strMeasure4 = '',
    this.strMeasure5 = '',
    this.strMeasure6 = '',
    this.strMeasure7 = '',
    this.strMeasure8 = '',
    this.strMeasure9 = '',
    this.strMeasure10 = '',
    this.strMeasure11 = '',
    this.strMeasure12 = '',
    this.strMeasure13 = '',
    this.strMeasure14 = '',
    this.strMeasure15 = '',
    this.strMeasure16 = '',
    this.strMeasure17 = '',
    this.strMeasure18 = '',
    this.strMeasure19 = '',
    this.strMeasure20 = '',
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  List<Map<String, String>> getIngredientsWithMeasures() {
    final ingredients = <String>[
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strIngredient6,
      strIngredient7,
      strIngredient8,
      strIngredient9,
      strIngredient10,
      strIngredient11,
      strIngredient12,
      strIngredient13,
      strIngredient14,
      strIngredient15,
      strIngredient16,
      strIngredient17,
      strIngredient18,
      strIngredient19,
      strIngredient20
    ];

    final measures = <String>[
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5,
      strMeasure6,
      strMeasure7,
      strMeasure8,
      strMeasure9,
      strMeasure10,
      strMeasure11,
      strMeasure12,
      strMeasure13,
      strMeasure14,
      strMeasure15,
      strMeasure16,
      strMeasure17,
      strMeasure18,
      strMeasure19,
      strMeasure20
    ];

    List<Map<String, String>> combined = [];
    for (int i = 0; i < ingredients.length; i++) {
      if (ingredients[i].isNotEmpty) {
        combined.add({"ingredient": ingredients[i], "measure": measures[i]});
      }
    }

    return combined;
  }

  int get ingredientCount {
    return getIngredientsWithMeasures().length;
  }
}
