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
            Text(
              'Ayam Bakar',
              style: styleTitle.copyWith(
                fontSize: setFontSize(50),
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(10),
            Text(
              'Genus : Genus',
              style: TextStyle(
                fontSize: setFontSize(30),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            Text(
              'Order : ',
              style: TextStyle(
                fontSize: setFontSize(30),
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            verticalSpace(20),
            Text(
              'Bananas are a great dietary source of potassium. One medium-sized banana typically contains about 450 mg of this mineral. Potassium is an essential mineral which helps maintain proper heart function and regulates your blood pressure. Bananas are also a great dietary source of vitamin C, vitamin B6, and fiber.',
              style: TextStyle(
                fontSize: setFontSize(30),
                color: greyColor,
              ),
            ),
            verticalSpace(20),
            Text(
              'Nutrition Facts',
              style: TextStyle(
                fontSize: setFontSize(30),
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            verticalSpace(10),
            Text(
              'Calories : ',
              style: TextStyle(
                fontSize: setFontSize(30),
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
