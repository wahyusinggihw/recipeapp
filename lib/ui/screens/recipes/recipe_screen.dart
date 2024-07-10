import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/router/route_list.dart';
import 'package:recipe_app/ui/screens/recipes/recipe_search_screen.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_grid.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        elevation: 0,
        title: CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 20,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
              child: IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              )),
        ],
      ),
      body: const RecipeScreenBody(),
    );
  }
}

class RecipeScreenBody extends StatelessWidget {
  const RecipeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RecipeSearch(),
          RecipeMenu(),
          RecipeHistory(),
        ],
      ),
    );
  }
}

class RecipeSearch extends StatelessWidget {
  const RecipeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: setHeight(30), horizontal: setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning',
            style: TextStyle(
              fontSize: setFontSize(40),
              fontWeight: FontWeight.w400,
            ).copyWith(color: Colors.grey[400]),
          ),
          verticalSpace(5),
          Text(
            'Find your favorite food',
            style: TextStyle(
              fontSize: setFontSize(60),
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalSpace(20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeSearchScreen(),
                ),
              );
            },
            child: Hero(
              tag: 'searchField',
              child: Material(
                child: IgnorePointer(
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
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeMenu extends StatelessWidget {
  const RecipeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(30), horizontal: setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today\'s recipe for you',
            style: TextStyle(
              fontSize: setFontSize(60),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: setHeight(650),
            child: RecipeGrid(),
          ),
        ],
      ),
    );
  }
}

class RecipeHistory extends StatelessWidget {
  const RecipeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(30), horizontal: setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your last recipe',
            style: TextStyle(
              fontSize: setFontSize(60),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: setHeight(325),
            child: RecipeGrid(
              makeHistory: true,
            ),
          ),
        ],
      ),
    );
  }
}
