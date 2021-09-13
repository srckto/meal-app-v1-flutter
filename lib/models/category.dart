import 'package:flutter/material.dart';
import 'package:meal_app_v1/styleClass.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = StyleClass.O_D97904,
  });
}
