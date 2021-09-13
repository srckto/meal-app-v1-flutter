import 'package:flutter/material.dart';
import 'package:meal_app_v1/screens/category_meals_screen.dart';

import '../styleClass.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  const CategoryItem({
    required this.color,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        // color: DUMMY_CATEGORIES[index].color,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                color,
                color.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: StyleClass.titleStyle,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, CategoryMealsScreen.route, arguments: {
          "id": id,
          "title": title,
        });
      },
    );
  }
}
