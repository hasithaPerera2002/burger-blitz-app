// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  const BurgerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: ListTile(
          leading: Image.asset('images/logo.png'),
          title: Text(
            'Burger',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Quicksand',
            ),
          ),
          subtitle: Text(
            'Rs 200 ',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Quicksand',
            ),
          ),
          trailing: Icon(Icons.arrow_forward_sharp),
        ));
  }
}
