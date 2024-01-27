// ignore_for_file: prefer_const_constructors, avoid_print, library_private_types_in_public_api

import 'package:burger_blitz/model/burger.dart';
import 'package:flutter/material.dart';

import '../views/order.dart';

class BurgerTile extends StatefulWidget {
  final Burger burger;
  const BurgerTile({Key? key, required this.burger}) : super(key: key);

  @override
  _BurgerTileState createState() => _BurgerTileState();
}

class _BurgerTileState extends State<BurgerTile> {
  @override
  void initState() {
    super.initState();
    updateImageUrl();
  }

  void updateImageUrl() {
    String imagePathForUrl = widget.burger.image.replaceAll('\\', '/');
    String newPort = "192.168.1.4:3000";
    setState(() {
      widget.burger.image =
          imagePathForUrl.replaceFirst("localhost:3000", newPort);
    });
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
        leading: Builder(
          builder: (context) {
            return Container(
              height: 250,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.burger.image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        title: SizedBox(
          width: 150,
          height: 30, // Adjust the width as needed
          child: Text(
            widget.burger.name,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.fade, // Handle overflow as needed
          ),
        ),
        subtitle: Text(
          'Rs ${widget.burger.price}',
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderPage(widget.burger),
              ),
            );
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
