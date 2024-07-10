import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class RecipePanelDetails extends StatelessWidget {
  ScrollController sc;
  // FruitsModel fruit;

  RecipePanelDetails({super.key, required this.sc});

  @override
  Widget build(BuildContext context) {
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
              'Ayam Bakar',
              style: styleTitle.copyWith(
                fontSize: setFontSize(50),
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),
            Text(
              'Seafood',
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            Text(
              'Indonesian',
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
                  '10 Items',
                  style: TextStyle(
                    fontSize: setFontSize(40),
                    fontWeight: FontWeight.w300,
                    color: greyColor,
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Text(
              'Sushi Rice',
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            verticalSpace(10),
            Text(
              'Rice wine',
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            verticalSpace(10),
            Text(
              'Caster Sugar',
              style: TextStyle(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
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
              'STEP 1\r\nTO MAKE SUSHI ROLLS: Pat out some rice. Lay a nori sheet on the mat, shiny-side down. Dip your hands in the vinegared water, then pat handfuls of rice on top in a 1cm thick layer, leaving the furthest edge from you clear.\r\n\r\nSTEP 2\r\nSpread over some Japanese mayonnaise. Use a spoon to spread out a thin layer of mayonnaise down the middle of the rice.\r\n\r\nSTEP 3\r\nAdd the filling. Get your child to top the mayonnaise with a line of their favourite fillings – here we’ve used tuna and cucumber.\r\n\r\nSTEP 4\r\nRoll it up. Lift the edge of the mat over the rice, applying a little pressure to keep everything in a tight roll.\r\n\r\nSTEP 5\r\nStick down the sides like a stamp. When you get to the edge without any rice, brush with a little water and continue to roll into a tight roll.\r\n\r\nSTEP 6\r\nWrap in cling film. Remove the mat and roll tightly in cling film before a grown-up cuts the sushi into thick slices, then unravel the cling film.\r\n\r\nSTEP 7\r\nTO MAKE PRESSED SUSHI: Layer over some smoked salmon. Line a loaf tin with cling film, then place a thin layer of smoked salmon inside on top of the cling film.\r\n\r\nSTEP 8\r\nCover with rice and press down. Press about 3cm of rice over the fish, fold the cling film over and press down as much as you can, using another tin if you have one.\r\n\r\nSTEP 9\r\nTip it out like a sandcastle. Turn block of sushi onto a chopping board. Get a grown-up to cut into fingers, then remove the cling film.\r\n\r\nSTEP 10\r\nTO MAKE SUSHI BALLS: Choose your topping. Get a small square of cling film and place a topping, like half a prawn or a small piece of smoked salmon, on it. Use damp hands to roll walnut-sized balls of rice and place on the topping.\r\n\r\nSTEP 11\r\nMake into tight balls. Bring the corners of the cling film together and tighten into balls by twisting it up, then unwrap and serve."',
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
