import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  late double _width;
  late double _height;
  late double _diagonal;

  double get width => _width;
  double get heigth => _height;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  @override
  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;
    _diagonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  dynamic wp(double porcen) => _width * porcen / 100;
  dynamic hp(double porcen) => _height * porcen / 100;
  dynamic dp(double porcen) => _diagonal * porcen / 100;
}
