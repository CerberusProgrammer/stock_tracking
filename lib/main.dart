import 'package:flutter/material.dart';
import 'package:stock_tracking/decoration.dart';
import 'package:stock_tracking/inventory/inventory.dart';
import 'package:stock_tracking/search.dart';

import 'home/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: theme,
    ),
    home: const MainHome(),
  ));
}

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<StatefulWidget> createState() => _MainHome();
}

class _MainHome extends State<MainHome> with SingleTickerProviderStateMixin {
  late TabController _controller;

  static const List<Tab> _tabs = [
    Tab(icon: Icon(Icons.home), text: 'Home'),
    Tab(icon: Icon(Icons.search), text: 'Search'),
    Tab(icon: Icon(Icons.inventory), text: 'Inventory'),
  ];

  static const List<Widget> _pages = [
    Home(),
    Search(),
    Inventory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Tracking'),
        actions: [
          IconButton(
            onPressed: () {
              (context as Element).reassemble();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: _pages,
      ),
      bottomNavigationBar: Material(
        child: TabBar(
          tabs: _tabs,
          controller: _controller,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _pages.length,
      vsync: this,
    );
  }
}
