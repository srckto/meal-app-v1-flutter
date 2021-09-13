import 'package:flutter/material.dart';
import 'package:meal_app_v1/screens/about.dart';
import 'package:meal_app_v1/screens/filter_screen.dart';
import 'package:meal_app_v1/screens/taps_screen.dart';
import 'package:meal_app_v1/styleClass.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Container(
              width: mediaQuery.width,
              child: Center(
                child: Text(
                  "Meal App",
                  style: TextStyle(
                    fontSize: 60,
                    color: StyleClass.R_D92818,
                    fontFamily: "CherryAndKisses",
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              // color: Colors.transparent,
              color: StyleClass.B_262523,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, TabsScreen.route),
            child: Text(
              'Categories',
              style: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, FilterScreen.route),
            child: Text(
              'Filters',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => AboutScreen())),
            child: Text(
              'About',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                color: StyleClass.B_262523,
                child: Center(
                  child: Text(
                    'v1.0.0',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
