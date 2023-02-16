import 'dart:ui';

import 'package:flutter/foundation.dart';

class Item {
  String name;
  String description;
  Category category;
  double value;
  Picture picture;
  String barCode;
  int quantity;
  bool available;

  Item({
    required this.name,
    required this.description,
    required this.category,
    required this.value,
    required this.picture,
    required this.barCode,
    required this.quantity,
    required this.available,
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

  Category get getCategory {
    return category;
  }

  set setCategory(Category category) {
    this.category = category;
  }

  double get getValue {
    return value;
  }

  set setValue(double value) {
    this.value = value;
  }

  Picture get getPicture {
    return picture;
  }

  set setPicture(Picture picture) {
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
