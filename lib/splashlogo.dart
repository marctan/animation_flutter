import 'package:flutter/material.dart';
class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 50,
          fontFamily: 'Ubuntu',
        ),
        children: [
          TextSpan(
            text: 'TES',
          ),
          TextSpan(
            text: ('T'),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          TextSpan(
            text: ('CO'),
          ),
        ],
      ),
    );
  }
}
