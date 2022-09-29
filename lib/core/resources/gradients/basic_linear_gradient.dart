import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:flutter/material.dart';

const List<Color> primaryGradientColor = [
  primaryBlue,
  primaryGreen,
];

Gradient basicLinearGradient() {
  return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: primaryGradientColor);
}

Gradient basicDiagonalGradient() {
  return const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: primaryGradientColor,
  );
}
