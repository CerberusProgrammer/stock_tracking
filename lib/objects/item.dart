import 'package:flutter/widgets.dart';
import 'package:stock_tracking/objects/category_item.dart';

class Item {
  String name;
  String description;
  CategoryItem category;
  double value;
  Image picture;
  String barCode;
  int quantity;
  bool available;

  Item({
    required this.name,
    this.description = '',
    required this.category,
    required this.value,
    this.picture = const Image(image: AssetImage('')),
    required this.barCode,
    this.quantity = 1,
    this.available = true,
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

  CategoryItem get getCategory {
    return category;
  }

  set setCategory(CategoryItem category) {
    this.category = category;
  }

  double get getValue {
    return value;
  }

  set setValue(double value) {
    this.value = value;
  }

  Image get getPicture {
    return picture;
  }

  set setPicture(Image picture) {
    this.picture = picture;
  }

  String get getBarCode {
    return barCode;
  }

  set setBarCode(String barCode) {
    this.barCode = barCode;
  }

  int get getQuantity {
    return quantity;
  }

  set setQuantity(int quantity) {
    this.quantity = quantity;
  }

  bool get getAvailable {
    return available;
  }

  set setAvailable(bool available) {
    this.available = available;
  }
}
