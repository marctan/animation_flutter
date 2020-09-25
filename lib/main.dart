import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding/provider/color_provider.dart';
import 'package:onboarding/screens/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Flutter',
      home: OnBoardingTest(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF425398),
          ),
          caption: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF425398),
          ),
          subtitle1: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF425398),
          ),
          bodyText2: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Color(0xFF425398),
          ),
        ),
        primaryColor: Color(0xFF6C63FF),
      ),
    );
  }
}

class OnBoardingTest extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color: Colors.white), //tile font size, weight and color
    bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.white),
    //body text size and color
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    //decription padding
    imagePadding: EdgeInsets.all(20), //image padding
    boxDecoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.1, 0.5, 0.7, 0.9],
        colors: [
          Colors.orange,
          Colors.deepOrangeAccent,
          Colors.red,
          Colors.redAccent,
        ],
      ),
    ), //show linear gradient background of page
  );

  List<PageViewModel> pages() {
    return [
      PageViewModel(
        decoration: pageDecoration,
        title: 'This is a sample title',
        footer: Text('Sample footer'),
        body: 'This is a sample body',
        image: SvgPicture.asset('assets/images/image1.svg'),
      ),
      PageViewModel(
        title: 'This is a sample title',
        footer: Text('Sample footer'),
        body: 'This is a sample body',
        image: SvgPicture.asset('assets/images/image1.svg'),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => ColorProvider(),
        child: OnBoarding(),
      ),
      // body: IntroductionScreen(
      //   curve: Curves.bounceOut,
      //   pages: pages(),
      //   done: Text('Done'),
      //   onDone: () {},
      // ),
    );
  }
}
