import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class RecipeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onClick;
  final bool isFav;
  final String imageUrl;
  const RecipeItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onClick,
    this.isFav = false,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: setHeight(30), horizontal: setWidth(30)),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: onClick,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl),
          ),
          title: Text(title,
              style: styleTitle.copyWith(
                fontSize: setFontSize(40),
                fontWeight: FontWeight.bold,
              )),
          subtitle: Text(subtitle,
              style: styleTitle.copyWith(
                fontSize: setFontSize(35),
                fontWeight: FontWeight.w400,
              )),
          trailing: isFav ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border, color: greyColor),
        ),
      ),
    );
  }
}
