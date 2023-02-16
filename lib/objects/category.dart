import 'package:flutter/material.dart';

class Category {
  String name;
  String description;
  Icon icon;
  Image image;

  Category(this.name, this.description, this.icon, this.image);

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

  Image get getImage {
    return image;
  }

  set setImage(Image image) {
    this.image = image;
  }
}
