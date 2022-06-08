import 'package:flutter/material.dart';
import 'package:rex_trading/onboarding.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Onboarding(),
    );
  }
}
