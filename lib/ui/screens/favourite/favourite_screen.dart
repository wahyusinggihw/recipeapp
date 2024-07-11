import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/view_models/recipe/recipe_provider.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/widgets/idle/idle_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const CircleAvatar(
          backgroundColor: Colors.orange,
          radius: 20,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
              child: IconButton(
                icon: const Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              )),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => RecipeProvider(),
        child: const FavouriteScreenBody(),
      ),
    );
  }
}

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          IdleItem(
            title: 'Your favourite recipe looks empty',
            isNoItem: true,
            disableAnimation: true,
          ),
        ],
      ),
    );
  }
}
