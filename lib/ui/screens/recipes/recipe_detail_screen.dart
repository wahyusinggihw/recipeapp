import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/core/view_models/recipe/recipe_provider.dart';
import 'package:recipe_app/ui/constant/constant.dart';
import 'package:recipe_app/ui/widgets/recipe/recipe_panel_details.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailScreen extends StatelessWidget {
  Meal recipe;
  RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: whiteColor),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.transparent, // 1
        elevation: 0, // 2
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => RecipeProvider(),
        child: RecipeBodyDetailScreen(recipe: recipe),
      ),
    );
  }
}

class RecipeBodyDetailScreen extends StatefulWidget {
  Meal recipe;
  RecipeBodyDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeBodyDetailScreen> createState() => _RecipeBodyDetailScreenState();
}

class _RecipeBodyDetailScreenState extends State<RecipeBodyDetailScreen> {
  final double _initFabHeight = setHeight(200);
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .90;
    double minHeight = MediaQuery.of(context).size.height / 2;
    return SlidingUpPanel(
      color: whiteColor,
      header: _slideHeader(),
      maxHeight: _panelHeightOpen,
      minHeight: minHeight,
      parallaxEnabled: true,
      parallaxOffset: .5,
      body: RecipeImage(imageUrl: widget.recipe.strMealThumb, heroTag: widget.recipe.strMeal),
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      onPanelSlide: (double pos) => setState(() {
        _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
      }),
      panelBuilder: (sc) => RecipePanelDetails(sc: sc, recipe: widget.recipe),
    );
  }

  Widget _slideHeader() => Container(
        width: deviceWidth,
        height: setHeight(100),
        decoration: const BoxDecoration(
          color: transparentColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Container(
            width: setWidth(100),
            height: setHeight(10),
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
}

class RecipeImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  const RecipeImage({super.key, required this.imageUrl, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1.2),
      child: ClipRRect(
        child: Hero(
          tag: heroTag,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
