// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const/colors.dart';

class MyButton extends StatelessWidget {
  final String lableText;
  final Null Function() onPressed;

  const MyButton({
    required this.lableText,
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(kTertiary),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(lableText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
