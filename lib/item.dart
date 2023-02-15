import 'dart:ui';

class Item {
  String name;
  String description;
  String category;
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
}
