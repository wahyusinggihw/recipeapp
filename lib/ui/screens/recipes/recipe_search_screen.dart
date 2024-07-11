import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/core/view_models/recipe/recipe_provider.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/widgets/idle/idle_item.dart';
import 'package:recipe_app/ui/widgets/idle/search_loading.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeSearchScreen extends StatelessWidget {
  const RecipeSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent, // 1
        elevation: 0, // 2
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => RecipeProvider(),
        child: const RecipeSearchInitScreen(),
      ),
    );
  }
}

class RecipeSearchInitScreen extends StatefulWidget {
  const RecipeSearchInitScreen({super.key});

  @override
  State<RecipeSearchInitScreen> createState() => _RecipeSearchInitScreenState();
}

class _RecipeSearchInitScreenState extends State<RecipeSearchInitScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(30), horizontal: setWidth(30)),
      child: Column(
        children: [
          Hero(
            tag: 'searchField',
            child: Material(
              child: TextField(
                autofocus: true,
                onSubmitted: (value) => RecipeProvider.instance(context).search(value),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search your favorite food',
                  prefixIcon: IconButton(
                      onPressed: () => RecipeProvider.instance(context).search(_searchController.text),
                      icon: const Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
                ),
              ),
            ),
          ),
          const RecipeSearchList()
        ],
      ),
    );
  }
}

class RecipeSearchList extends StatelessWidget {
  const RecipeSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, searchProv, _) {
      if (searchProv.searchRecipes == null && searchProv.onSearch == false) {
        return const IdleItem(
          title: 'Find your favorite food here!',
        );
      }

      if (searchProv.searchRecipes == null && searchProv.onSearch == true) {
        return const Skeletonizer(child: SearchLoading());
      }

      if (searchProv.searchRecipes!.isEmpty) {
        return const IdleItem(
          title: 'Oops, no recipe found!',
          isNoItem: true,
        );
      }
      return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: searchProv.searchRecipes!.length,
            itemBuilder: (context, index) {
              Meal result = searchProv.searchRecipes![index];
              return RecipeItem(
                  title: result.strMeal,
                  subtitle: result.strArea,
                  imageUrl: result.strMealThumb,
                  onClick: () => Navigator.pushNamed(context, routeRecipeDetail, arguments: result));
            }),
      );
    });
  }
}
