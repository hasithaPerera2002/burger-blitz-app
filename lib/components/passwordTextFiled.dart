// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../const/colors.dart';

class PasswordTextField extends StatefulWidget {
  final String textLabel;
  final TextEditingController controller;

  PasswordTextField({
    Key? key, // Use Key? for optional key parameter
    required this.textLabel,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    obscureText = !obscureText;
                  },
                );
              },
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: kPrimary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            label: Text(
              widget.textLabel,
              style: TextStyle(
                color: kPrimary,
                fontSize: 15,
                fontFamily: 'Quicksand',
              ),
            )),
      ),
    );
  }
}
