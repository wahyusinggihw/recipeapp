import 'package:flutter/material.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_card.dart';

class RecipeLoading extends StatelessWidget {
  const RecipeLoading({super.key});

  @override
  Widget build(context) {
    return RecipeCard(
      // placeholder
      title: 'Loading',
      subtitle: 'Loading',
      imageUrl: 'https://via.assets.so/img.jpg?w=400&h=150&tc=blue&bg=#cecece',
      onTap: () {},
    );
  }
}
