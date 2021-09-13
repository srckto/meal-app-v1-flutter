import 'package:flutter/material.dart';
import 'package:meal_app_v1/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styleClass.dart';

class FilterScreen extends StatefulWidget {
  static const route = "/FilterScreen";

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool? _isGlutenFree = false, _isLactoseFree = false, _isVegan = false, _isVegetarian = false;

  Future getPreferenceValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      _isGlutenFree = _pref.getBool("isGlutenFree");
      _isLactoseFree = _pref.getBool("isLactoseFree");
      _isVegan = _pref.getBool("isVegan");
      _isVegetarian = _pref.getBool("isVegetarian");
    });
  }

  @override
  void initState() {
    getPreferenceValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SwitchListTile(
            title: Text(
              "Gluten Free",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            value: _isGlutenFree!,
            onChanged: (bool value) {
              setState(() {
                _isGlutenFree = value;
              });
            },
          ),
          SizedBox(height: 10),
          SwitchListTile(
            title: Text(
              "Lactose Free",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            value: _isLactoseFree!,
            onChanged: (bool value) {
              setState(() {
                _isLactoseFree = value;
              });
            },
          ),
          SizedBox(height: 10),
          SwitchListTile(
            title: Text(
              "Vegan",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            value: _isVegan!,
            onChanged: (bool value) {
              setState(() {
                _isVegan = value;
              });
            },
          ),
          SizedBox(height: 10),
          SwitchListTile(
            title: Text(
              "Vegetarian",
              style: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            value: _isVegetarian!,
            onChanged: (bool value) {
              setState(() {
                _isVegetarian = value;
              });
            },
          ),
          SizedBox(height: 25),
          Container(
            width: 150,
            child: ElevatedButton(
              onPressed: () async {
                Provider.of<MealProvider>(context, listen: false).filter(
                  isGlutenFree: _isGlutenFree!,
                  isLactoseFree: _isLactoseFree!,
                  isVegan: _isVegan!,
                  isVegetarian: _isVegetarian!,
                );
                SharedPreferences _pref = await SharedPreferences.getInstance();
                _pref.setBool("isGlutenFree", _isGlutenFree!);
                _pref.setBool("isLactoseFree", _isLactoseFree!);
                _pref.setBool("isVegan", _isVegan!);
                _pref.setBool("isVegetarian", _isVegetarian!);
              },
              child: Text(
                "Save",
                style: TextStyle(fontSize: 20, color: StyleClass.W2_FDFEE2),
              ),
              style: ElevatedButton.styleFrom(
                  primary: StyleClass.R_D92818,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
