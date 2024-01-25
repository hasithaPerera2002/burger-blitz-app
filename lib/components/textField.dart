// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const/colors.dart';

class TextField1 extends StatelessWidget {
  final String textLabel;
  final controller;
  final bool obscureText;

  const TextField1({
    super.key,
    required this.textLabel,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            label: Text(
              textLabel,
              style: TextStyle(
                color: kPrimary,
                fontSize: 15,
              ),
            )),
      ),
    );
  }
}
