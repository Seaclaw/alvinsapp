//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            children: [
              buildPage(
                  color: Colors.blue,
                  urlimage: 'asset/stock1.png',
                  title: 'Welcome to Rex',
                  subtitle:
                      'Join our trading platform that is trusted by over one million users')
            ],
          )),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(2),
                child: const Text('SKIP')),
            Center(
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: ScaleEffect(),
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn))),
            TextButton(
                onPressed: () => controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInCubic),
                child: const Text('NEXT'))
          ],
        ),
      ),
    );
  }

//new method called buildPage that will define the structure of each page in the onboarding screen
  Widget buildPage({
    required Color color,
    required String urlimage,
    required String title,
    required String subtitle,
  }) =>
      Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Scaffold(backgroundColor: color),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              urlimage,
              fit: BoxFit.contain,
              width: double.infinity, //image
            ),
          ),
        ),
        const SizedBox(
          height: 32, //the gap between
        ),
        SizedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto Slab' //title
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
            child: Container(
          alignment: Alignment.center,
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 21), //subtitle
          ),
        )),
      ]));
}
