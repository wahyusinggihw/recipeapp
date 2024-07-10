import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_item.dart';

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
      body: RecipeSearchInitScreen(),
    );
  }
}

class RecipeSearchInitScreen extends StatelessWidget {
  const RecipeSearchInitScreen({super.key});

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
                decoration: InputDecoration(
                  hintText: 'Search your favorite food',
                  prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.filter_list)),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) => RecipeItem(
              title: 'Ayam Bakar',
              subtitle: 'Indonesian',
              imageUrl: 'https://www.themealdb.com/images/media/meals/tyywsw1505930373.jpg',
              onClick: () {},
            ),
          )
        ],
      ),
    );
  }
}
