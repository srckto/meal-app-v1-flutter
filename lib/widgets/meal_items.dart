import 'package:flutter/material.dart';
import 'package:meal_app_v1/models/meal.dart';
import 'package:meal_app_v1/screens/meal_detail_screen.dart';

import '../styleClass.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String? imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get _complexity {
    if (complexity == Complexity.Simple) return "Simple";
    if (complexity == Complexity.Hard) return "Hard";
    if (complexity == Complexity.Challenging)
      return "Challenging";
    else
      return "Unknow";
  }

  String get _affordability {
    if (affordability == Affordability.Affordable) return "Affordable";
    if (affordability == Affordability.Luxurious) return "Luxurious";
    if (affordability == Affordability.Pricey)
      return "Pricey";
    else
      return "Unknow";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: StyleClass.R_D92818.withOpacity(0.5),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 260,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: StyleClass.B_262523,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        SizedBox(width: 5),
                        Text("$duration min"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        SizedBox(width: 5),
                        Text("$_complexity"),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.production_quantity_limits_rounded),
                        SizedBox(width: 5),
                        Text("$_affordability"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, MealDetail.route, arguments: {
          "id": id,
        });
      },
    );
  }
}
