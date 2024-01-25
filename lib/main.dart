// ignore_for_file: prefer_const_constructors

import 'package:burger_blitz/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burger Blitz',
      darkTheme: ThemeData.light(),
      home: HomePage(),
    );
  }
}
