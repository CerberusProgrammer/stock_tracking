import 'package:flutter/material.dart';

import '../objects/items.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<StatefulWidget> createState() => _Items();
}

class _Items extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: items[index].category.color,
          child: ListTile(
            leading: items[index].category.icon,
            title: Text(items[index].name),
            subtitle: Text(items[index].description),
            onTap: () {},
          ),
        );
      },
    ));
  }
}
