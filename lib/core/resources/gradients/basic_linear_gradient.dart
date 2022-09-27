import 'package:flutter/material.dart';

const List<Color> primaryGradientColor = [
  Color(0xFF018ADF),
  Color(0xFF00BD9B),
];

Gradient basicLinearGradient(){
  return const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: primaryGradientColor
  );
}

Gradient basicDiagonalGradient(){
  return const LinearGradient(
    begin:
      Alignment.bottomLeft,
    end:
      Alignment.topRight,
    colors: primaryGradientColor,
  );
}