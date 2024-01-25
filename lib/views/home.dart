// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:burger_blitz/components/burgerTile.dart';
import 'package:burger_blitz/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> apiCall() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Handle the response as needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Text(
            'Burger Blitz',
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: kPrimary,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: kTertiary,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                child: BurgerTile(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
