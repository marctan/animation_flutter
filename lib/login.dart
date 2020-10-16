import 'package:animation/splashlogo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final AnimationController controller;
  final BuildContext ctx;
  LoginScreen(this.controller, this.ctx)
      : logoOffset = Tween<double>(begin: 250, end: 0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.17,
              curve: Curves.easeIn,
            ),
          ),
        ),
        opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.15,
              curve: Curves.easeIn,
            ),
          ),
        ),
        align = AlignmentGeometryTween(
                begin: Alignment.center, end: Alignment.topCenter)
            .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.30,
              curve: Curves.easeIn,
            ),
          ),
        ),
        padding = Tween<double>(begin: 0.0, end: 90.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.30),
          ),
        );

  final Animation<double> logoOffset;
  final Animation<double> opacity;
  final Animation<double> padding;
  final Animation<AlignmentGeometry> align;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              return Stack(
                children: [
                  Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: padding.value),
                        child: Opacity(
                          opacity: opacity.value,
                          child: AppLogo(),
                        ),
                      ),
                      alignment: align.value),
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 90,
                        ),
                        child: Opacity(
                          opacity: 0,
                          child: AppLogo(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: deviceSize.width * 0.8,
                          margin: const EdgeInsets.only(bottom: 50),
                          padding: const EdgeInsets.all(15.0),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0,
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFE5E5E5),
                                        labelText: 'email',
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xFFE5E5E5),
                                        labelText: 'password',
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0),
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: deviceSize.width,
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: BorderSide(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 1.3),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.all(18),
                                            child: Text(
                                              'settings_login',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: deviceSize.width,
                                        child: RaisedButton(
                                          child: Container(
                                            margin: EdgeInsets.all(18),
                                            child: Text(
                                              'sign up',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      FlatButton(
                                        child: Text('forgot_password'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class LogoAnimation extends StatefulWidget {
  @override
  _LogoAnimationState createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );

    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen(_controller, context);
  }
}
