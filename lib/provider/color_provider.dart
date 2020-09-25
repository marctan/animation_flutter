import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  Color _color = Color(0xFF005699);
  double _index = 0.0;

  set color(Color color) {
    _color = color;
    notifyListeners();
  }

  get color {
    return _color;
  }

  set index(index){
    _index = index;
  }

  double get index {
    return _index;
  }

}