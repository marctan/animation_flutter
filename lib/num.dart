import 'package:flutter/material.dart';

class NumberAnimation extends StatefulWidget {
  @override
  _NumberAnimationState createState() => _NumberAnimationState();
}

class _NumberAnimationState extends State<NumberAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<int> numb;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    numb = IntTween(begin: 0, end: 255).animate(
      CurvedAnimation(
        curve: Curves.bounceIn,
        parent: _controller,
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Text(
            numb.value.toString(),
          );
        },
      ),
    );
  }
}
