// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:burger_blitz/components/textField.dart';
import 'package:flutter/material.dart';

import '../components/myButton.dart';
import '../const/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomePageState();
}

class _HomePageState extends State<LoginPage> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Burger Blitz',
            style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Icon(Icons.lock, color: kPrimary, size: 75),
            SizedBox(height: 25),
            Text(
              'Welcome to Burger Blitz ',
              style: TextStyle(
                color: kSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 80),
            TextField1(
              obscureText: false,
              textLabel: 'Username',
              controller: userNameController,
            ),
            SizedBox(height: 20),
            TextField1(
              obscureText: true,
              textLabel: 'Password',
              controller: passwordController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: kSecondary,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            MyButton(
              lableText: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(
                        color: kSecondary,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
