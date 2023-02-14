import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:stock_tracking/add_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<StatefulWidget> {
  int _selectedItem = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Tracking'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text("Drawer Header"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: const Text('Inventory'),
                leading: const Icon(Icons.train),
                onTap: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
      body: const Center(child: Text('Hola bebe')),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'search',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory), label: 'inventory'),
        ],
        currentIndex: _selectedItem,
        onTap: _onItemTaped,
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
