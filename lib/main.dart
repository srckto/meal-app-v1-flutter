import 'package:flutter/material.dart';
import 'package:meal_app_v1/providers/meal_provider.dart';
import 'package:meal_app_v1/screens/favorites_srceen.dart';
import 'package:meal_app_v1/screens/filter_screen.dart';
import 'package:meal_app_v1/screens/meal_detail_screen.dart';
import 'package:meal_app_v1/screens/taps_screen.dart';
import 'package:meal_app_v1/styleClass.dart';
import 'package:provider/provider.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // to get only availabe meal on begin app.
    Provider.of<MealProvider>(context, listen: false).updateAllMealAvailable();
    Provider.of<MealProvider>(context, listen: false).upDateFavoriteMeal();
    Provider.of<MealProvider>(context, listen: false).setFilterValue();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: StyleClass.R_D92818,
        accentColor: StyleClass.O_D97904,
        buttonColor: StyleClass.B_262523,
        canvasColor: StyleClass.W_FDFEE2.withAlpha(250),
      ),
      title: 'Meal App',
      routes: {
        "/": (_) => TabsScreen(),
        TabsScreen.route: (_) => TabsScreen(),
        FilterScreen.route: (_) => FilterScreen(),
        FavoritesScreen.route: (_) => FavoritesScreen(),
        CategoriesScreen.route: (_) => CategoriesScreen(),
        CategoryMealsScreen.route: (_) => CategoryMealsScreen(),
        MealDetail.route: (_) => MealDetail(),
      },
      // home: CategoriesScreen(),
    );
  }
}
