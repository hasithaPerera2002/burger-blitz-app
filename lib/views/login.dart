// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unrelated_type_equality_checks, use_build_context_synchronously, invalid_return_type_for_catch_error

import 'package:burger_blitz/components/password_text_filed.dart';
import 'package:burger_blitz/components/textField.dart';
import 'package:burger_blitz/service/user_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
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
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Burger Blitz',
            style: TextStyle(
              color: kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'Quicksand',
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
                  fontFamily: 'Quicksand'),
            ),
            SizedBox(height: 80),
            TextField1(
              textLabel: 'Email',
              controller: userNameController,
            ),
            SizedBox(height: 20),
            PasswordTextField(
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
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Quicksand',
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
                login(userNameController.text, passwordController.text)
                    .then(
                  (value) => {
                    if (value == true)
                      {Navigator.pushReplacementNamed(context, '/home')}
                    else
                      {
                        print(value),
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: kTertiary,
                              title: Text('Notification'),
                              content: Text(
                                'Invalid Credentials',
                                style: TextStyle(
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                      context,
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        ),
                      },
                  },
                )
                    .catchError((e) {
                  print(e);
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('An error occurred: $e'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      'Don\'t have an account? Sign Up',
                      style: TextStyle(
                        color: kSecondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Quicksand',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    dynamic loginResult = await UserService().login(email, password);
    print(loginResult);
    if (loginResult != null && loginResult is bool && loginResult) {
      print('user logged in');
      return true;
    } else {
      print('user not logged in');
      return false;
    }
  }
}
