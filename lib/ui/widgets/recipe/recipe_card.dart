import 'package:flutter/material.dart';
import 'package:recipe_app/ui/constant/constant.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool makeHistory;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.makeHistory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: title,
      child: ClipRRect(
        borderRadius: defaultRadius,
        child: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Container(
              color: accentColor, // Background color for the card
              child: Stack(
                children: [
                  // Image fills the entire card
                  Positioned.fill(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // White overlay at the bottom
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0.0, 0.5],
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: makeHistory ? setFontSize(40) : setFontSize(50),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: setFontSize(35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
