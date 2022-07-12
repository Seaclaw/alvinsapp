//import 'dart:html';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  static const String id = '/signuppage';
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() =>
      _SignUpState(); //create Stateful widget called SignUp
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}

//STUB: WILL COMPLETE CODE IN THE NEXT ASSIGNMENT
