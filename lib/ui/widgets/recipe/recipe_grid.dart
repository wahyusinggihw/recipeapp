import 'package:flutter/material.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_card.dart';

class RecipeGrid extends StatelessWidget {
  // final List<FruitsModel> fruits;
  const RecipeGrid({super.key});

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
      itemCount: 2,
      itemBuilder: (context, index) {
        // FruitsModel fruit = fruits[index];
        return RecipeCard(
            // fruit: fruit,
            title: 'Ayam Bakar',
            subtitle: 'Indonesian',
            imageUrl: 'https://www.themealdb.com/images/media/meals/tyywsw1505930373.jpg',
            onTap: () => Navigator.pushNamed(context, routeRecipeDetail));
      },
    );
    ;
  }
}
