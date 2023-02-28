import 'package:flutter/material.dart';
import 'package:stock_tracking/home/add_item.dart';
import 'package:stock_tracking/objects/categories.dart';
import 'package:stock_tracking/objects/items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Categories.categoryList.isNotEmpty) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AdderItem()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
