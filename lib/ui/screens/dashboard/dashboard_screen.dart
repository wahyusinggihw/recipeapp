import 'package:flutter/material.dart';
import 'package:recipe_app/ui/screens/favourite/favourite_screen.dart';
import 'package:recipe_app/ui/screens/recipes/recipe_screen.dart';
import 'package:recipe_app/ui/screens/setting/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final _menuList = [
    const RecipesScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: _menuList[_selectedIndex],
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      onTap: (index) {
        if (index != _selectedIndex) {
          setState(() {
            _selectedIndex = index;
          });
        }
      },
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          activeIcon: Icon(Icons.menu_book),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          activeIcon: Icon(Icons.favorite),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          activeIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
