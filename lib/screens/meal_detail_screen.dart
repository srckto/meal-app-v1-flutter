import 'package:flutter/material.dart';
import 'package:meal_app_v1/models/meal.dart';
import 'package:meal_app_v1/providers/meal_provider.dart';
import 'package:meal_app_v1/styleClass.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const route = "/MealDetail";

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? idArg = routeArg["id"];
    final Meal itemSelected = DUMMY_MEALS.firstWhere((element) => element.id == idArg);
    int stepsCount = 0;
    int ingredientsCount = 0;
    Provider.of<MealProvider>(context , listen: false).changeIcon(itemSelected.id);
    bool? _iconStat = Provider.of<MealProvider>(context ).iconState;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemSelected.title),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  itemSelected.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Ingredients",
            textAlign: TextAlign.center,
            style: StyleClass.titleStyle,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: StyleClass.B_262523,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: itemSelected.ingredients.map((element) {
                  ingredientsCount++;
                  return Column(
                    children: [
                      Text(
                        element,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: StyleClass.W2_FDFEE2,
                        ),
                      ),
                      if (ingredientsCount != itemSelected.ingredients.length) Divider(thickness: 2),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Text(
            "Steps",
            textAlign: TextAlign.center,
            style: StyleClass.titleStyle,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: StyleClass.B_262523,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: itemSelected.steps.map((element) {
                  stepsCount++;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$stepsCount - $element",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: StyleClass.W2_FDFEE2,
                        ),
                      ),
                      if (stepsCount != itemSelected.steps.length) Divider(thickness: 2),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences _pref = await SharedPreferences.getInstance();
          _pref.containsKey(itemSelected.id) ? _pref.remove(itemSelected.id) : _pref.setString(itemSelected.id, itemSelected.id);
          await Provider.of<MealProvider>(context, listen: false).addFavoriteMealOrRemove(mealSelectedId: itemSelected.id, mealSelect: itemSelected);

          print("keys ${_pref.getKeys()}");
        },
        child: Icon( _iconStat! ? Icons.star : Icons.star_border, size: 29),
      ),
    );
  }
}
