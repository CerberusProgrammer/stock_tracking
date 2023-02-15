import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<StatefulWidget> createState() => _AddCategory();
}

class _AddCategory extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: const Center(child: Text('hi')),
    );
  }
}
