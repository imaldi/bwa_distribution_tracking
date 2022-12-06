import 'package:flutter/material.dart';

const primaryColor = Color(0xFF38AFA0);
const primaryDarkerColor = Color(0xFF2C8C80);
const primaryBlue = Color(0xFF018ADF);
const primaryGreen = Color(0xFF00BD9B);
const primaryBlueTransparent = Color(0xBB018ADF);
const primaryGreenTransparent = Color(0xBB00BD9B);
const hintTextColor = Color(0xFFC5C5C5);
const listColorLight = Color(0xFF01A2AD);
const listColorDark = Color(0xFF11828A);
const selesaiTagColor = Color(0xFF95D310);

Map<int, Color> customPrimarySwatch = {
  50: Color.fromRGBO(0, 189, 155, .1),
  100: Color.fromRGBO(0, 189, 155, .2),
  200: Color.fromRGBO(0, 189, 155, .3),
  300: Color.fromRGBO(0, 189, 155, .4),
  400: Color.fromRGBO(0, 189, 155, .5),
  500: Color.fromRGBO(0, 189, 155, .6),
  600: Color.fromRGBO(0, 189, 155, .7),
  700: Color.fromRGBO(0, 189, 155, .8),
  800: Color.fromRGBO(0, 189, 155, .9),
  900: Color.fromRGBO(0, 189, 155, 1),
};

MaterialColor customPrimaryMaterialColor = MaterialColor(0xFF00BD9B, customPrimarySwatch);