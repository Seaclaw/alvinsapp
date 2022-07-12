import 'package:flutter/material.dart';
import 'package:rex_trading/signup.dart';
//import 'package:flutter/rendering.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_login/flutter_login.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key? key})
      : super(key: key); //create a stateful widget called _onBoarding
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false; //set the variable isLastPage to false
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _storeOnBoardInfo() async {
    //create async function called _storeOnBoardInfo which assists in only showing onboarding screen once
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onboard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: PageView(
                controller: controller, //creates the onboarding screen
                onPageChanged: (index) {
                  setState(() => isLastPage =
                      index == 5); //specifies the number of pages necessary
                },
                children: [
              pageBuild(
                  //create the first page
                  color: Colors.blue,
                  urlimage: 'asset/stock1.png',
                  title: 'Welcome to Rex',
                  subtitle:
                      'Join our trading app that is trusted by over one milion users',
                  logo: 'asset/rex.png'),
              pageBuild(
                  //create the second page
                  color: Colors.blue,
                  urlimage: 'asset/photo-1.png',
                  title: 'Crypto and Stocks',
                  subtitle:
                      'Invest in crypto and stocks on the same app and reduce the hassle',
                  logo: 'asset/rex.png'),
              pageBuild(
                  //create the third page
                  color: Colors.blue,
                  urlimage: 'asset/stock3.png',
                  title: 'Invest in ASX and Wall St.',
                  subtitle: 'Keep up with your portfolio any time of the day',
                  logo: 'asset/rex.png'),
              pageBuild(
                  //create the fourth page
                  color: Colors.blue,
                  urlimage: 'asset/stock4.png',
                  title: 'Keep up with your capital gains tax',
                  subtitle:
                      'Rex will automatically record any capital gains tax which will reduce the arduous effort when tax season arrives',
                  logo: 'asset/rex.png'),
              pageBuild(
                  //create the fifth page
                  color: Colors.blue,
                  urlimage: 'asset/stock5.png',
                  title: 'Get on-demand support',
                  subtitle:
                      'Rex has a function that allows investors to directly contact our customer service team for any queries',
                  logo: 'asset/rex.png'),
              pageBuild(
                  //create the sixth page
                  color: Colors.blue,
                  urlimage: 'asset/stock6.png',
                  title: 'Watch our free training videos',
                  subtitle:
                      'Rex offers rookie investors with a series of training videos to help them get started',
                  logo: 'asset/rex.png')
            ])),
        bottomSheet:
            isLastPage //boolean variable, if it is the last page then add a 'Let's Go' button
                ? TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      primary: Colors.white,
                      backgroundColor: Colors.blue.shade700,
                      minimumSize: const Size.fromHeight(
                          80), //size, shape and colour of button
                    ),
                    onPressed: () async {
                      await _storeOnBoardInfo();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              SignUp())); //once the SKIP button is pressed, navigate to the SignUp screen
                    },
                    child:
                        const Text('Let\'s Go', style: TextStyle(fontSize: 24)))
                : Container(
                    padding: const EdgeInsets.all(8),
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
                                  count:
                                      6, //the progress bar in the middle of the bottomsheet (6 circles)
                                  effect: ScaleEffect(),
                                  onDotClicked: (index) => controller.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves
                                          .fastLinearToSlowEaseIn))), //transition between pages
                          TextButton(
                              child: const Text('NEXT'),
                              onPressed: () => controller.nextPage(
                                  //'NEXT' button which causes the next page to display
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves
                                      .decelerate)) //transition between pages
                        ])));
  }

//new method called pageBuild that will define the structure of each page in the onboarding screen
  Widget pageBuild({
    required Color color, //background colour
    required String urlimage, //the complementary image
    required String title,
    required String subtitle,
    required String logo,
  }) =>
      Container(
          width: MediaQuery.of(this.context)
              .size
              .width, //create a container with the width of the size of the screen
          height: MediaQuery.of(this.context)
              .size
              .height, //create a container with the height of the size of the screen
          child: Stack(children: [
            Container(
                padding: const EdgeInsets.only(
                    bottom:
                        100), //create an inset of 100 pixels from the bottom
                decoration: BoxDecoration(
                  color: color, //background colour
                )),
            Padding(
                padding: const EdgeInsets.all(
                    10), //create a margin of 10 pixels from all sides
                child: Align(
                  alignment: Alignment(0, 0.55), //align the image
                  child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.9, //make the image 90% of the width of the screen
                      height: MediaQuery.of(context).size.height *
                          0.3, //make the image 30% of the height of the screen
                      child: Image.asset(
                        urlimage, //image
                        width: double
                            .infinity, //occupies the space of the container
                        fit: BoxFit.cover,
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(
                  15), //create a margin og 15 pixels on all sides
              child: Align(
                  alignment: Alignment(0, -0.55), //align the title
                  child: Container(
                    width: MediaQuery.of(this.context).size.width *
                        0.8, //make a container with the width of 80% of the screen
                    height: MediaQuery.of(this.context).size.height *
                        0.2, //make a container with the height of 20% of the screen
                    child: AutoSizeText(
                      title,
                      textAlign: TextAlign
                          .center, //align the text to the centre of the container
                      maxLines:
                          2, //make the maximum number of lines required for the title to be 2
                      minFontSize: 24, //the minimum font size is 24
                      maxFontSize: 35, //the maximum font size is 35
                      style: TextStyle(
                          color: Colors.white, //font colour
                          fontSize:
                              27, //default font size is 27 (this will change depending on the size of the screen and the max/min font values)
                          fontFamily: 'Roboto Slab', //font style
                          fontWeight: FontWeight.bold), //bolded font
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  10), //create a margin of 10 pixels on all sides of the screen
              child: Align(
                alignment: Alignment(0, -0.18), //align the subtitle
                child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.7, //make a container with the width of 70% of the screen
                    height: MediaQuery.of(context).size.height *
                        0.2, //make a container with the height of 20% of the screen
                    child: AutoSizeText(subtitle, //subtitle writing
                        textAlign: TextAlign
                            .center, //align the subtitle to the centre of the container
                        maxLines:
                            4, //make the maximum number of lines for the subtitle to be four
                        minFontSize: 17, //minimum font size is 17
                        maxFontSize: 24, //minimum font size is 24
                        style: TextStyle(
                            color: Colors.white, //font colour is white
                            fontSize:
                                20, //default font size is 20 (this will change depending on the size of the screen and the max/min font values)
                            fontWeight: FontWeight.w300))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  15), //create a margin on all sides of 15 pixels
              child: Align(
                alignment: Alignment(0, -0.96), //align the image
                child: Container(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.2, //create a container with the width of 20% of the screen's width
                    height: MediaQuery.of(context).size.height *
                        0.2, //create a container with the height of 20% of the screen's height
                    child: Image.asset(
                      logo,
                      fit: BoxFit.contain,
                      width: double.infinity, //fit the image into the container
                    ),
                  ),
                ),
              ),
            )
          ]));
}
