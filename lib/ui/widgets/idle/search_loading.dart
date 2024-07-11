import 'package:flutter/material.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_item.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return RecipeItem(
      // placeholder
      title: 'Loading',
      subtitle: 'Loading',
      imageUrl: 'https://via.placeholder.com/400x150',
      onClick: () {},
    );
  }
}
