import 'package:flutter/material.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_card.dart';

class RecipeGrid extends StatelessWidget {
  final List<Meal> recipe;
  final bool makeHistory;
  const RecipeGrid({super.key, required this.recipe, this.makeHistory = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: recipe.length,
      itemBuilder: (context, index) {
        // FruitsModel fruit = fruits[index];
        Meal r = recipe.elementAt(index);
        return RecipeCard(
            // fruit: fruit,
            makeHistory: makeHistory,
            title: r.strMeal,
            subtitle: r.strArea,
            imageUrl: r.strMealThumb,
            onTap: () => Navigator.pushNamed(context, routeRecipeDetail));
      },
    );
  }
}
