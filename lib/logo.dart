import 'package:flutter/material.dart';

class FlutterLogoAnim extends StatefulWidget {
  @override
  _FlutterLogoAnimState createState() => _FlutterLogoAnimState();
}

class _FlutterLogoAnimState extends State<FlutterLogoAnim>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<double> opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 7000,
      ),
    );
    // )..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       _controller.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       _controller.forward();
    //     }
    //   });

    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(_controller);

    opacity = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: FadeTransition(
      //   opacity: opacity,
      //   child: FlutterLogo(),
      // ),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, ch) {
          return Opacity(
            opacity: opacity.value,
            child: Container(
              width: animation.value,
              height: animation.value,
              child: ch,
            ),
          );
        },
        child: FlutterLogo(),
      ),
    );
  }
}
