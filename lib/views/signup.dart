// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables, avoid_print

import 'package:burger_blitz/components/my_button.dart';
import 'package:burger_blitz/components/password_text_filed.dart';
import 'package:burger_blitz/components/textField.dart';
import 'package:burger_blitz/model/user.dart';
import 'package:burger_blitz/service/user_service.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool firstNameErr = false;
  bool secondNameErr = false;
  bool passwordErr = false;
  bool emailErr = false;
  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    secondNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Finish Sign Up',
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
            SizedBox(height: 100),
            TextField1(
              textLabel: 'First Name',
              controller: firstNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    firstNameErr ? 'Please enter your first name' : '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            TextField1(
              textLabel: 'Second Name',
              controller: secondNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    secondNameErr ? 'Please enter your second name' : '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            TextField1(
              textLabel: 'Email',
              controller: emailController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    emailErr ? 'Please enter your Email' : '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            PasswordTextField(
              textLabel: 'Password',
              controller: passwordController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    passwordErr ? 'Please enter your password' : '',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'By creating an account you agree to our Terms of Service and Privacy Policy',
                style: TextStyle(
                  color: kSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Quicksand',
                ),
              ),
            ),
            SizedBox(height: 50),
            MyButton(
              lableText: 'Agree & Continue ',
              onPressed: () {
                setState(() {
                  firstNameController.text.isEmpty
                      ? firstNameErr = true
                      : firstNameErr = false;
                  secondNameController.text.isEmpty
                      ? secondNameErr = true
                      : secondNameErr = false;
                  emailController.text.isEmpty
                      ? emailErr = true
                      : emailErr = false;
                  passwordController.text.isEmpty
                      ? passwordErr = true
                      : passwordErr = false;
                });
                if (!firstNameErr &&
                    !secondNameErr &&
                    !emailErr &&
                    !passwordErr) {
                  signUp(firstNameController.text, secondNameController.text,
                          emailController.text, passwordController.text)
                      .then(
                    (value) => {
                      if (value == true)
                        {
                          print('user saved'),
                          Navigator.pushNamed(context, '/home'),
                        }
                      else
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: kTertiary,
                                title: Text('Notification'),
                                content: Text(
                                  'User already exists',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/signUp');
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
                      .catchError(
                    (e) {
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
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Do you have an account? Sign In',
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

  Future<bool> signUp(
      String fname, String lname, String email, String password) async {
    dynamic saveUserResult = await UserService().saveUser(
        User(fname: fname, lname: lname, email: email, password: password));

    if (saveUserResult != null && saveUserResult is bool && saveUserResult) {
      print('user saved');
      return true;
    } else {
      print('user not saved');
      return false;
    }
  }
}
