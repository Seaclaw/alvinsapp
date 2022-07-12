import 'package:flutter/material.dart';
import 'package:rex_trading/onboarding.dart';
import 'package:rex_trading/signup.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'dart:html';
//import 'package:flutter/rendering.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter_login/flutter_login.dart';
//import 'package:firebase_auth/firebase_auth.dart';

int? isViewed;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]); //disable landscape mode

  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //isViewed = prefs.getInt('onboard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //don't show debug banner
        theme: ThemeData(
            primarySwatch: Colors.blue), //set primary theme colour to blue
        home: isViewed != 0
            ? Onboarding()
            : SignUp()); //if the user has already viewed the onboarding screen, head to the SignUp page otherwise head to the Onboarding screen.
  }
}
