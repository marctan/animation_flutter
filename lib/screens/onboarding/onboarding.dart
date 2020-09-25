import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/provider/color_provider.dart';
import 'package:onboarding/screens/onboarding/components/onboard_page.dart';
import 'package:onboarding/screens/onboarding/data/onboard_page_data.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pageController = PageController();
  double _index = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _index = pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemBuilder: (_, index) {
            return OnBoardPage(
              onboardData[index],
              pageController,
            );
          },
          onPageChanged: (index) {
            final provider = Provider.of<ColorProvider>(context, listen: false);
            provider.color = onboardData[index].accentColor;
          },
          itemCount: onboardData.length,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 32.0,
              left: 32,
            ),
            child: Consumer<ColorProvider>(
              builder: (_, provider, __) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'join us',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: provider.color,
                          ),
                    ),
                    Text(
                      'Close',
                      style: TextStyle(
                        color: provider.color,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 32,
            ),
            child: Consumer<ColorProvider>(
              builder: (_, provider, __) {
                return DotsIndicator(
                  dotsCount: onboardData.length,
                  position: _index,
                  decorator: DotsDecorator(
                    activeColor: provider.color,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
