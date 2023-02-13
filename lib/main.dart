import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.red,
            onPrimary: Color.fromARGB(255, 238, 232, 232),
            secondary: Color.fromARGB(255, 153, 41, 34),
            onSecondary: Color.fromARGB(255, 153, 41, 34),
            error: Colors.red,
            onError: Colors.red,
            background: Color.fromARGB(255, 36, 10, 8),
            onBackground: Color.fromARGB(255, 75, 22, 18),
            surface: Color.fromARGB(255, 97, 23, 18),
            onSurface: Color.fromARGB(255, 232, 225, 225))),
    home: const Home(),
  ));
}
