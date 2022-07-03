//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:rex_trading/signup.dart';
//import 'package:rex_trading/signup.dart';
//import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_login/flutter_login.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 3);
                },
                children: [
              buildPage(
                  color: Colors.blue,
                  urlimage: 'asset/stock1.png',
                  title: 'Welcome to Rex',
                  subtitle:
                      'Join our trading app that is trusted by over one milion users',
                  logo: 'asset/rex.png'),
              buildPage(
                  color: Colors.blue,
                  urlimage: 'asset/photo-1.png',
                  title: 'Crypto and Stocks',
                  subtitle:
                      'Invest in crypto and stocks on the same app and reduce the hassle',
                  logo: 'asset/rex.png'),
              buildPage(
                  color: Colors.blue,
                  urlimage: 'asset/stock3.png',
                  title: 'Invest in ASX and Wall St.',
                  subtitle: 'Keep up with your portfolio any time of the day',
                  logo: 'asset/rex.png'),
              buildPage(
                  color: Colors.blue,
                  urlimage: 'asset/stock4.png',
                  title: 'Keep up with your capital gains tax',
                  subtitle:
                      'Rex will automatically record any capital gains tax which will reduce the arduous effort when tax season arrives',
                  logo: 'asset/rex.png')
            ])),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue.shade700,
                    minimumSize: const Size(800, 80)),
                onPressed: () async {
                  await _storeOnBoardInfo();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text('Let\'s Go', style: TextStyle(fontSize: 24)))
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                height: 80,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () async {
                            await _storeOnBoardInfo();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: const Text('SKIP')),
                      Center(
                          child: SmoothPageIndicator(
                              controller: controller,
                              count: 4,
                              effect: ScaleEffect(),
                              onDotClicked: (index) => controller.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn))),
                      TextButton(
                          child: const Text('NEXT'),
                          onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate))
                    ])));
  }

//new method called buildPage that will define the structure of each page in the onboarding screen
  Widget buildPage({
    required Color color,
    required String urlimage,
    required String title,
    required String subtitle,
    required String logo,
  }) =>
      Container(
          width: MediaQuery.of(this.context).size.width,
          height: MediaQuery.of(this.context).size.height,
          child: Stack(children: [
            Container(
                padding: const EdgeInsets.only(bottom: 100),
                decoration: BoxDecoration(
                  color: color, //background colour
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment(0, 0.55),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                        urlimage, //image
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                  alignment: Alignment(0, -0.55),
                  child: Container(
                    width: MediaQuery.of(this.context).size.width * 0.8,
                    height: MediaQuery.of(this.context).size.height * 0.2,
                    child: Text(title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontFamily: 'Roboto Slab',
                            fontWeight: FontWeight.bold)), //title
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment(0, -0.2),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300, //subtitle
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment(0, -0.9),
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment(0, -0.96),
                    child: Image.asset(
                      logo,
                      fit: BoxFit.contain,
                      width: double.infinity, //logo
                    ),
                  ),
                ),
              ),
            )
          ]));
}
