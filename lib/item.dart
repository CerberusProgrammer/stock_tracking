import 'dart:ui';

class Item {
  String name;
  String description;
  double value;
  Picture picture;
  String barCode;
  int quantity;
  bool available;

  Item({
    required this.name,
    required this.description,
    required this.value,
    required this.picture,
    required this.barCode,
    required this.quantity,
    required this.available,
  });
}
