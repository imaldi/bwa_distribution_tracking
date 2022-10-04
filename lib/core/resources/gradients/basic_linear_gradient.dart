import 'package:bwa_distribution_tracking/core/resources/consts/colors.dart';
import 'package:flutter/material.dart';

const List<Color> primaryGradientColor = [
  primaryBlue,
  primaryGreen,
];

const List<Color> primaryGradientColorTransparent = [
  primaryBlueTransparent,
  primaryGreenTransparent,
];

Gradient basicLinearGradient() {
  return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: primaryGradientColorTransparent);
}

Gradient basicDiagonalGradient() {
  return const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: primaryGradientColor,
  );
}
