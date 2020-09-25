import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/provider/color_provider.dart';
import 'package:onboarding/screens/onboarding/components/drawer_paint.dart';
import 'package:onboarding/screens/onboarding/data/onboard_page_data.dart';
import 'package:onboarding/screens/onboarding/models/onboard_page_model.dart';
import 'package:provider/provider.dart';

class OnBoardPage extends StatefulWidget {
  final OnBoardPageModel pageModel;
  final PageController pageController;
  @override
  _OnBoardPageState createState() => _OnBoardPageState();

  OnBoardPage(
    this.pageModel,
    this.pageController,
  );
}

class _OnBoardPageState extends State<OnBoardPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> heroAnimation;
  Animation<double> drawerAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    heroAnimation = Tween<double>(begin: -40, end: 0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
    );

    drawerAnimation = Tween<double>(begin: 75, end: 50).animate(
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
    );

    animationController.forward(
      from: 0,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _clickNext() {
    int currentpage = widget.pageController.page.toInt();
    if(currentpage + 1 == onboardData.length) {
      return;
    }
    final provider = Provider.of<ColorProvider>(context, listen: false);
    provider.color = widget.pageModel.nextAccentColor;

    widget.pageController.nextPage(
      duration: Duration(
        milliseconds: 100,
      ),
      curve: Curves.easeInToLinear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.pageModel.primeColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AnimatedBuilder(
                  animation: heroAnimation,
                  builder: (_, __) {
                    return Transform.translate(
                      offset: Offset(heroAnimation.value, 0),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 32,
                            left: 32,
                            top: 32,
                          ),
                          child: SvgPicture.asset(
                            widget.pageModel.imagePath,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pageModel.caption,
                        style: TextStyle(
                          fontSize: 24,
                          color: widget.pageModel.accentColor.withOpacity(0.8),
                          letterSpacing: 1,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.pageModel.subtitle,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: widget.pageModel.accentColor,
                          letterSpacing: 1,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.pageModel.description,
                        style: TextStyle(
                          fontSize: 18,
                          color: widget.pageModel.accentColor.withOpacity(
                            0.9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: drawerAnimation,
            builder: (_, __) {
              return CustomPaint(
                painter: DrawerPaint(
                  widget.pageModel.accentColor,
                ),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: drawerAnimation.value,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 27,
                      ),
                      color: widget.pageModel.primeColor,
                      onPressed: () {
                        _clickNext();
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
