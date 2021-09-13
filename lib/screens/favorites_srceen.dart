import 'package:flutter/material.dart';
import 'package:meal_app_v1/providers/meal_provider.dart';
import 'package:meal_app_v1/widgets/meal_items.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  static const route = "/FavoritesScreen";

  @override
  Widget build(BuildContext context) {
    final mealListFavorite = Provider.of<MealProvider>(context).favoriteMeals;
    return Scaffold(
      body: mealListFavorite.isEmpty
          ? Center(child: Text("You don't have any favorite meal."))
          : ListView.builder(
              itemCount: mealListFavorite.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: mealListFavorite[index].id,
                  title: mealListFavorite[index].title,
                  imageUrl: mealListFavorite[index].imageUrl,
                  duration: mealListFavorite[index].duration,
                  complexity: mealListFavorite[index].complexity,
                  affordability: mealListFavorite[index].affordability,
                );
              },
            ),
    );
  }
}
