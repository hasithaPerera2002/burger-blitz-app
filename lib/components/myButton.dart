// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const/colors.dart';

class MyButton extends StatelessWidget {
  final String lableText;
  const MyButton({
    required this.lableText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(kTertiary),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            lableText,
          ),
        ),
      ),
    );
  }
}
