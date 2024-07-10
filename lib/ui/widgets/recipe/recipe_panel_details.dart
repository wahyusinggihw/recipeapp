import 'package:flutter/material.dart';
import 'package:recipe_app/core/models/recipe.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class RecipePanelDetails extends StatelessWidget {
  ScrollController sc;
  // FruitsModel fruit;
  Meal recipe;

  RecipePanelDetails({super.key, required this.sc, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final ingredientsWithMeasures = recipe.getIngredientsWithMeasures();
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: setWidth(50), vertical: setHeight(50)),
        child: ListView(
          controller: sc,
          children: [
            verticalSpace(50),
            Text(
              recipe.strMeal,
              style: styleTitle.copyWith(
                fontSize: setFontSize(50),
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),
            Text(
              recipe.strCategory,
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            Text(
              recipe.strArea,
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: setFontSize(40),
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                Text(
                  '${recipe.ingredientCount.toString()} items',
                  style: TextStyle(
                    fontSize: setFontSize(40),
                    fontWeight: FontWeight.w300,
                    color: greyColor,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recipe.ingredientCount,
              itemBuilder: (context, index) {
                Map<String, String> ing = ingredientsWithMeasures[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: setHeight(10)),
                  child: Row(
                    children: [
                      Container(
                        width: setWidth(20),
                        height: setHeight(20),
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        ing['measure']!,
                        style: TextStyle(
                          fontSize: setFontSize(35),
                          fontWeight: FontWeight.w400,
                          color: greyColor,
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        ing['ingredient']!,
                        style: TextStyle(
                          fontSize: setFontSize(35),
                          fontWeight: FontWeight.w400,
                          color: greyColor,
                        ),
                      ),
                      // Image.network(
                      //   'https://www.themealdb.com/images/ingredients/${ing['ingredient']}.png',
                      //   width: setWidth(50),
                      //   height: setHeight(50),
                      // )
                    ],
                  ),
                );
              },
            ),
            verticalSpace(50),
            Text(
              'Instructions',
              style: TextStyle(
                fontSize: setFontSize(40),
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            verticalSpace(10),
            Text(
              recipe.strInstructions,
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
