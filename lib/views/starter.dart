// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:burger_blitz/components/my_button.dart';
import 'package:burger_blitz/const/colors.dart';
import 'package:flutter/material.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(50),
            child: Image.asset('images/logo.png'),
          ),
          Text(
            'Explore the Taste',
            style: TextStyle(
              color: kPrimary,
              fontSize: 40,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(height: 20),
          Text(
            'How do you like your burger?',
            style: TextStyle(
              color: kSecondary,
              fontSize: 20,
              fontFamily: 'Quicksand',
            ),
          ),
          SizedBox(height: 50),
          MyButton(
            lableText: 'Enter Shop',
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      )),
    );
  }
}
