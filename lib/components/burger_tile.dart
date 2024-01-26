// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:burger_blitz/const/colors.dart';
import 'package:burger_blitz/model/burger.dart';
import 'package:flutter/material.dart';

class BurgerTile extends StatelessWidget {
  final Burger burger;
  const BurgerTile({super.key, required this.burger});

  getImage() {
    String imagePathForUrl = burger.image.replaceAll('\\', '/');
    String newPort = "192.168.1.4:3000";
    return imagePathForUrl.replaceFirst("localhost:3000", newPort);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Container(
          height: 250,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(getImage()),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: SizedBox(
          width: 150,
          height: 30, // Adjust the width as needed
          child: Text(
            burger.name,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade, // Handle overflow as needed
          ),
        ),
        subtitle: Text(
          'Rs ${burger.price}',
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.normal,
          ),
        ),
        trailing: MaterialButton(
          height: 100,
          minWidth: 50,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(500),
          ),
          child: Icon(Icons.arrow_forward_sharp),
          onPressed: () {
            print('tapped');
          },
        ),
        focusColor: Color.fromARGB(255, 215, 157, 157),
        horizontalTitleGap: 30,
        minVerticalPadding: 40,
        minLeadingWidth: 60,
        hoverColor: Color.fromARGB(255, 157, 185, 215),
      ),
    );
  }
}
