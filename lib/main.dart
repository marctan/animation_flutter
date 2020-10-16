import 'dart:io';

import 'package:animation/bounce.dart';
import 'package:animation/container_transform.dart';
import 'package:animation/hero.dart';
import 'package:animation/logo.dart';
import 'package:animation/num.dart';
import 'package:animation/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: //HeroTest(),
          Scaffold(
        body: Center(
          child: SplashScreen(), //ContainerTransform(),
          //FlutterLogoAnim(),
          //child: NumberAnimation(),
          // child: BounceInDown(
          //   child: Container(
          //     width: 50,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       color: Colors.blueAccent,
          //     ),
          //   ),
          // ),
        ),
      ),
      title: 'Test Animation',
    );
  }
}
