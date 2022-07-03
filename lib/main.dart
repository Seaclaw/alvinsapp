import 'package:flutter/material.dart';
import 'package:rex_trading/onboarding.dart';

import 'package:rex_trading/signup.dart';
//import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:html';
//import 'package:flutter/rendering.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter_login/flutter_login.dart';
//import 'package:firebase_auth/firebase_auth.dart';

int? isViewed;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: isViewed != 0 ? SignUp() : Onboarding());
  }
}
