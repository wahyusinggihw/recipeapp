import 'package:flutter/material.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_card.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_loading.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeGrid extends StatelessWidget {
  final List<Meal> recipe;
  final bool makeHistory;
  final bool isLoading;
  const RecipeGrid({super.key, required this.recipe, this.makeHistory = false, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      ignoreContainers: true,
      containersColor: Colors.grey[300]!,
      switchAnimationConfig: const SwitchAnimationConfig(
        duration: Duration(milliseconds: 300),
      ),
      enableSwitchAnimation: true,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          childAspectRatio: 1.1,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: isLoading ? 5 : recipe.length,
        itemBuilder: (context, index) {
          if (isLoading) {
            return const RecipeLoading();
          }

          Meal r = recipe.elementAt(index);
          return RecipeCard(
              // fruit: fruit,
              makeHistory: makeHistory,
              title: r.strMeal,
              subtitle: r.strArea,
              imageUrl: r.strMealThumb,
              onTap: () => Navigator.pushNamed(context, routeRecipeDetail, arguments: r));
        },
      ),
    );
  }
}
