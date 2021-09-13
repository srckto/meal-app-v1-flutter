import 'package:flutter/material.dart';
import 'package:meal_app_v1/screens/categories_screen.dart';
import 'package:meal_app_v1/screens/favorites_srceen.dart';
import 'package:meal_app_v1/styleClass.dart';
import 'package:meal_app_v1/widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  static const route = "/TabsScreen";
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  List<String> _pagesTitle = [
    "Categories",
    "Your favorite Meals",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesTitle[_currentIndex]),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.category : Icons.category_outlined, size: 27),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(_currentIndex == 0 ? Icons.star_outline : Icons.star, size: 27),
            label: "Favorites",
          ),
        ],
        backgroundColor: StyleClass.R_D92818,
        selectedItemColor: StyleClass.W_FDFEE2,
      ),
      drawer: CustomDrawer(),
    );
  }
}
