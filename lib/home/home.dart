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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.insert_emoticon),
              title: Text('Title of $index item'),
              subtitle: Text('Subtitle of $index item'),
              onTap: () {},
            ),
          );
        },
      ),
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
