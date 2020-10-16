import 'dart:async';

import 'package:animation/login.dart';
import 'package:animation/splashlogo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), changeScreen);
  }

  void changeScreen() async {
    // Get render box of the widget

    await Navigator.push(context, MaterialPageRoute(builder: (_) {
      return LogoAnimation();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          key: _widgetKey,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [AppLogo()],
        ),
      ),
    );

  //   final deviceSize = MediaQuery.of(context).size;

  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     body: SingleChildScrollView(
  //       child: Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         child: Stack(
  //           children: [
  //             Container(
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 0),
  //                 child: AppLogo(),
  //               ),
  //               alignment: Alignment.center,
  //             ),
  //             Column(
  //               children: <Widget>[
  //                 Container(
  //                   alignment: Alignment.center,
  //                   margin: EdgeInsets.only(
  //                     top: 90,
  //                   ),
  //                   child: Opacity(
  //                     opacity: 0,
  //                     child: AppLogo(),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Container(
  //                     alignment: Alignment.bottomCenter,
  //                     width: deviceSize.width * 0.8,
  //                     margin: const EdgeInsets.only(bottom: 50),
  //                     padding: const EdgeInsets.all(15.0),
  //                     child: SingleChildScrollView(
  //                       child: Padding(
  //                         padding: EdgeInsets.only(
  //                           top: 10,
  //                           bottom: MediaQuery.of(context).viewInsets.bottom,
  //                         ),
  //                         child: Column(
  //                           children: <Widget>[
  //                             Opacity(
  //                               opacity: 0,
  //                               child: TextFormField(
  //                                 keyboardType: TextInputType.emailAddress,
  //                                 decoration: InputDecoration(
  //                                   filled: true,
  //                                   fillColor: Color(0xFFE5E5E5),
  //                                   labelText: 'email',
  //                                   border: OutlineInputBorder(
  //                                     borderRadius: const BorderRadius.all(
  //                                       Radius.circular(5.0),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 textInputAction: TextInputAction.next,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 15,
  //                             ),
  //                             TextFormField(
  //                               obscureText: true,
  //                               decoration: InputDecoration(
  //                                   filled: true,
  //                                   fillColor: Color(0xFFE5E5E5),
  //                                   labelText: 'password',
  //                                   border: OutlineInputBorder(
  //                                     borderRadius: const BorderRadius.all(
  //                                       Radius.circular(5.0),
  //                                     ),
  //                                   )),
  //                             ),
  //                             SizedBox(
  //                               height: 40,
  //                             ),
  //                             Column(
  //                               children: [
  //                                 SizedBox(
  //                                   width: deviceSize.width,
  //                                   child: FlatButton(
  //                                     shape: RoundedRectangleBorder(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       side: BorderSide(
  //                                           color:
  //                                               Theme.of(context).primaryColor,
  //                                           width: 1.3),
  //                                     ),
  //                                     child: Container(
  //                                       margin: EdgeInsets.all(18),
  //                                       child: Text(
  //                                         'settings_login',
  //                                         style: TextStyle(
  //                                             fontSize: 18,
  //                                             color: Theme.of(context)
  //                                                 .primaryColor),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   height: 10,
  //                                 ),
  //                                 SizedBox(
  //                                   width: deviceSize.width,
  //                                   child: RaisedButton(
  //                                     child: Container(
  //                                       margin: EdgeInsets.all(18),
  //                                       child: Text(
  //                                         'sign up',
  //                                         style: TextStyle(
  //                                           fontSize: 18,
  //                                           color: Colors.white,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     color: Theme.of(context).primaryColor,
  //                                   ),
  //                                 ),
  //                                 FlatButton(
  //                                   child: Text('forgot_password'),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
    }
}
