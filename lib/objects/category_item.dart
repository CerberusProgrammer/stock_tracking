import 'package:flutter/material.dart';
import 'package:stock_tracking/objects/category_item.dart';

class CategoryItem {
  String name;
  String description;
  Icon icon;
  Color color;

  CategoryItem({
    required this.name,
    this.description = '',
    this.icon = const Icon(Icons.category),
    this.color = Colors.red,
  });

  String get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  String get getDescription {
    return description;
  }

  set setDescription(String description) {
    this.description = description;
  }

  Icon get getIcon {
    return icon;
  }

  set setIcon(Icon icon) {
    this.icon = icon;
  }

  Color get getColor {
    return color;
  }

  set setImage(Color color) {
    this.color = color;
  }
}
