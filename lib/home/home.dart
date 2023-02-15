import 'package:flutter/material.dart';
import 'package:stock_tracking/home/add_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Hola bebe')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdderItem()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
