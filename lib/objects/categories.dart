import 'package:flutter/material.dart';
import 'package:stock_tracking/objects/category_item.dart';

class Categories {
  static List<CategoryItem> categoryList = [];

  static List<DropdownMenuItem<String>> toWidget() {
    List<DropdownMenuItem<String>> result = [];

    for (CategoryItem item in categoryList) {
      result.add(DropdownMenuItem(
        value: item.name,
        child: Text(item.name),
      ));
    }

    return result;
  }
}
