// ignore_for_file: prefer_const_constructors

import 'package:burger_blitz/views/login.dart';
import 'package:burger_blitz/views/starter.dart';
import 'package:flutter/material.dart';

import 'views/home.dart';
import 'views/signup.dart';

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
      initialRoute: '/starter',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signUp': (context) => SignUp(),
        '/starter': (context) => Starter(),
      },
    );
  }
}
